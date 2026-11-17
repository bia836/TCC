<?php

require_once __DIR__ . '/../Model/modelQuiz.php';

class QuizController
{
    private Quiz $quizModel;

    private const QUESTOES_MISTO = 10;

    public function __construct($conn)
    {
        $this->quizModel = new Quiz($conn);
    }

    private function ir(string $caminho): void
    {
        header('Location: /TCC/public' . $caminho);
        exit;
    }

    public function index()
    {
        $idAnoEscolhido = filter_input(INPUT_GET, 'id_ano', FILTER_VALIDATE_INT);
        $idAnoDoAluno = $_SESSION['id_ano'] ?? null;

        $erro = $_SESSION['quizErro'] ?? null;
        unset($_SESSION['quizErro']);

        if ($idAnoEscolhido) {
            $ano = $this->quizModel->buscarAno($idAnoEscolhido);
            $materias = $ano ? $this->quizModel->listarMaterias($idAnoEscolhido) : [];

            if (!$ano || empty($materias)) {
                $this->ir('/quizzes');
            }

            $totalQuestoes = array_sum(array_column($materias, 'total'));
        } else {
            $anos = $this->quizModel->listarAnos();
        }

        require __DIR__ . '/../View/escolher.php';
    }

    public function iniciar()
    {
        $idAno = filter_input(INPUT_GET, 'id_ano', FILTER_VALIDATE_INT);
        $idMateria = filter_input(INPUT_GET, 'id_materia', FILTER_VALIDATE_INT);
        $modo = $_GET['modo'] ?? 'misto';

        if (!$idAno || !$this->quizModel->buscarAno($idAno)) {
            $this->ir('/quizzes');
        }

        if ($modo === 'materia') {
            if (!$idMateria || !$this->quizModel->materiaPertenceAoAno($idMateria, $idAno)) {
                $this->ir('/quizzes?id_ano=' . $idAno);
            }
            $ids = $this->quizModel->sortearPorMateria($idMateria);
        } elseif ($modo === 'completo') {
            $ids = $this->quizModel->sortearPorAno($idAno);
        } else {
            $modo = 'misto';
            $ids = $this->quizModel->sortearPorAno($idAno, self::QUESTOES_MISTO);
        }

        if (empty($ids)) {
            $_SESSION['quizErro'] = 'Ainda não há questões cadastradas para essa escolha.';
            $this->ir('/quizzes?id_ano=' . $idAno);
        }

        $_SESSION['quiz'] = [
            'id_ano'     => $idAno,
            'id_materia' => $idMateria ?: 0,
            'modo'       => $modo,
            'ids'        => $ids, 
            'atual'      => 0,    
            'respostas'  => [],  
            'ordem'      => [], 
        ];

        $this->ir('/quizzes/questao');
    }

    public function questao()
    {
        $quiz = $_SESSION['quiz'] ?? null;

        if (!$quiz) {
            $this->ir('/quizzes');
        }

        $total = count($quiz['ids']);

        if ($quiz['atual'] >= $total) {
            $this->ir('/quizzes/resultado');
        }

        $idAtividade = $quiz['ids'][$quiz['atual']];
        $questao = $this->quizModel->buscarQuestao($idAtividade);
        $alternativas = $this->quizModel->listarAlternativas($idAtividade);

        if (!$questao || count($alternativas) < 2) {
            $_SESSION['quiz']['atual']++;
            $this->ir('/quizzes/questao');
        }

        if (!isset($_SESSION['quiz']['ordem'][$idAtividade])) {
            $ordem = array_map('intval', array_column($alternativas, 'id'));
            shuffle($ordem);
            $_SESSION['quiz']['ordem'][$idAtividade] = $ordem;
        }

        $ordem = $_SESSION['quiz']['ordem'][$idAtividade];
        usort($alternativas, fn($a, $b) => array_search((int) $a['id'], $ordem) <=> array_search((int) $b['id'], $ordem));

        $resposta = $quiz['respostas'][$idAtividade] ?? null;
        $numero = $quiz['atual'] + 1;
        $percentual = (int) round(($quiz['atual'] / $total) * 100);

        $erro = $_SESSION['quizErro'] ?? null;
        unset($_SESSION['quizErro']);

        require __DIR__ . '/../View/questao.php';
    }

    public function responder()
    {
        $quiz = $_SESSION['quiz'] ?? null;

        if (!$quiz || $quiz['atual'] >= count($quiz['ids'])) {
            $this->ir('/quizzes');
        }

        $idAtividade = $quiz['ids'][$quiz['atual']];

        if (isset($quiz['respostas'][$idAtividade])) {
            $this->ir('/quizzes/questao');
        }

        $idAlternativa = filter_input(INPUT_POST, 'id_alternativa', FILTER_VALIDATE_INT);
        $escolhida = $idAlternativa ? $this->quizModel->buscarAlternativa($idAlternativa, $idAtividade) : false;

        if (!$escolhida) {
            $_SESSION['quizErro'] = 'Escolha uma alternativa antes de responder.';
            $this->ir('/quizzes/questao');
        }

        $correta = $this->quizModel->buscarCorreta($idAtividade);
        $acertou = (int) $escolhida['correta'] === 1;

        $this->quizModel->salvarProgresso($_SESSION['id_pessoa'], $idAtividade, $acertou);

        $_SESSION['quiz']['respostas'][$idAtividade] = [
            'id_alternativa' => (int) $escolhida['id'],
            'id_correta'     => $correta ? (int) $correta['id'] : 0,
            'acertou'        => $acertou,
        ];

        $this->ir('/quizzes/questao');
    }

    public function proxima()
    {
        $quiz = $_SESSION['quiz'] ?? null;

        if (!$quiz) {
            $this->ir('/quizzes');
        }

        $idAtividade = $quiz['ids'][$quiz['atual']] ?? null;

        if ($idAtividade !== null && isset($quiz['respostas'][$idAtividade])) {
            $_SESSION['quiz']['atual']++;
        }

        $this->ir('/quizzes/questao');
    }

    public function resultado()
    {
        $quiz = $_SESSION['quiz'] ?? null;

        if (!$quiz) {
            $this->ir('/quizzes');
        }

        $total = count($quiz['ids']);

        if ($quiz['atual'] < $total) {
            $this->ir('/quizzes/questao');
        }

        $detalhes = $this->quizModel->buscarDetalhes($quiz['ids']);

        $idsAlternativas = [];
        foreach ($quiz['respostas'] as $r) {
            $idsAlternativas[] = $r['id_alternativa'];
            $idsAlternativas[] = $r['id_correta'];
        }
        $textos = $this->quizModel->buscarTextos($idsAlternativas);

        $acertos = 0;
        $porMateria = [];   // [matéria => ['acertos' => n, 'total' => n]]
        $erradas = [];      // questões para revisão

        foreach ($quiz['ids'] as $idAtividade) {
            if (!isset($quiz['respostas'][$idAtividade], $detalhes[$idAtividade])) {
                continue;
            }

            $r = $quiz['respostas'][$idAtividade];
            $d = $detalhes[$idAtividade];
            $materia = $d['materia'];

            $porMateria[$materia]['total'] = ($porMateria[$materia]['total'] ?? 0) + 1;
            $porMateria[$materia]['acertos'] = $porMateria[$materia]['acertos'] ?? 0;

            if ($r['acertou']) {
                $acertos++;
                $porMateria[$materia]['acertos']++;
            } else {
                $erradas[] = [
                    'materia'  => $materia,
                    'pergunta' => $d['pergunta'],
                    'escolhida' => $textos[$r['id_alternativa']] ?? '',
                    'correta'  => $textos[$r['id_correta']] ?? '',
                ];
            }
        }

        $respondidas = count($quiz['respostas']);
        $percentual = $respondidas > 0 ? (int) round(($acertos / $respondidas) * 100) : 0;

        $anoQuiz = $this->quizModel->buscarAno($quiz['id_ano']);

        $linkRefazer = '/TCC/public/quizzes/iniciar?id_ano=' . (int) $quiz['id_ano'] . '&modo=' . urlencode($quiz['modo']);
        if ($quiz['modo'] === 'materia') {
            $linkRefazer .= '&id_materia=' . (int) $quiz['id_materia'];
        }

        require __DIR__ . '/../View/resultado.php';
    }

    public function sair()
    {
        $idAno = $_SESSION['quiz']['id_ano'] ?? null;
        unset($_SESSION['quiz']);

        $this->ir($idAno ? '/quizzes?id_ano=' . (int) $idAno : '/quizzes');
    }
    
}
