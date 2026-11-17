<?php
require_once __DIR__ . '/../Model/modelConteudo.php';
class ConteudoAdminController {
    private Conteudo $conteudoModel;
    public function __construct($conn) { $this->conteudoModel = new Conteudo($conn); }
    private function exigirProfessor(): void {
        if (empty($_SESSION['id_pessoa'])) { header('Location: /TCC/public/login'); exit; }
        if ((int)($_SESSION['id_nivel'] ?? 0) !== 2) { http_response_code(403); exit('Acesso negado. Área exclusiva para professores.'); }
    }
    private function voltar(string $msg, bool $erro=false): void {
        $_SESSION[$erro ? 'erro_conteudo' : 'mensagem_conteudo'] = $msg;
        header('Location: /TCC/public/professor/conteudos'); exit;
    }
    public function index(): void {
        $this->exigirProfessor(); $anos=$this->conteudoModel->listarAnos(); $materias=$this->conteudoModel->listarMaterias(); $conteudos=$this->conteudoModel->listarTodos();
        $mensagem=$_SESSION['mensagem_conteudo'] ?? ''; $erro=$_SESSION['erro_conteudo'] ?? '';
        unset($_SESSION['mensagem_conteudo'],$_SESSION['erro_conteudo']); $conteudoEdicao=null;
        require __DIR__ . '/../View/gerenciarConteudos.php';
    }
    public function editar(): void {
        $this->exigirProfessor(); $id=filter_input(INPUT_GET,'id',FILTER_VALIDATE_INT);
        if(!$id || $id<1) $this->voltar('Conteúdo inválido.',true);
        $conteudoEdicao=$this->conteudoModel->buscarPorId($id);
        if(!$conteudoEdicao) $this->voltar('Conteúdo não encontrado.',true);
        $anos=$this->conteudoModel->listarAnos(); $materias=$this->conteudoModel->listarMaterias(); $conteudos=$this->conteudoModel->listarTodos(); $mensagem=''; $erro='';
        require __DIR__ . '/../View/gerenciarConteudos.php';
    }
    public function salvar(): void {
        $this->exigirProfessor(); $dados=$this->validar($_POST); if(isset($dados['erro'])) $this->voltar($dados['erro'],true);
        try { $this->conteudoModel->criar($dados); $this->voltar('Conteúdo cadastrado com sucesso!'); }
        catch(PDOException $e) { error_log($e->getMessage()); $this->voltar('Erro ao cadastrar conteúdo.',true); }
    }
    public function atualizar(): void {
        $this->exigirProfessor(); $id=filter_input(INPUT_POST,'id',FILTER_VALIDATE_INT);
        if(!$id || !$this->conteudoModel->buscarPorId($id)) $this->voltar('Conteúdo não encontrado.',true);
        $dados=$this->validar($_POST); if(isset($dados['erro'])) $this->voltar($dados['erro'],true);
        try { $this->conteudoModel->atualizar($id,$dados); $this->voltar('Conteúdo atualizado com sucesso!'); }
        catch(PDOException $e) { error_log($e->getMessage()); $this->voltar('Erro ao atualizar conteúdo.',true); }
    }
    public function excluir(): void {
        $this->exigirProfessor(); $id=filter_input(INPUT_POST,'id',FILTER_VALIDATE_INT);
        if(!$id || $id<1) $this->voltar('Conteúdo inválido.',true);
        try { if(!$this->conteudoModel->excluir($id)) $this->voltar('Conteúdo não encontrado.',true); $this->voltar('Conteúdo excluído com sucesso!'); }
        catch(PDOException $e) { error_log($e->getMessage()); $this->voltar('Erro ao excluir conteúdo.',true); }
    }
    private function validar(array $p): array {
        $titulo=trim($p['titulo']??''); $ano=filter_var($p['id_ano']??null,FILTER_VALIDATE_INT); $materia=filter_var($p['id_materia']??null,FILTER_VALIDATE_INT);
        $tipo=$p['tipo']??''; $descricao=trim($p['descricao']??''); $url=trim($p['url_video']??''); $texto=trim($p['texto_conteudo']??'');
        if($titulo==='' || mb_strlen($titulo)>150) return ['erro'=>'Informe um título com até 150 caracteres.'];
        if(!$ano || !$materia || !$this->conteudoModel->materiaPertenceAno($materia, $ano)) return ['erro'=>'Selecione um ano e uma matéria correspondentes.'];
        if(!in_array($tipo,['aula','resumo','dica'],true)) return ['erro'=>'Tipo de conteúdo inválido.'];
        if($url!=='') { $scheme=strtolower((string)parse_url($url,PHP_URL_SCHEME)); if(!filter_var($url,FILTER_VALIDATE_URL)||!in_array($scheme,['http','https'],true)||mb_strlen($url)>255) return ['erro'=>'Informe um link válido (http/https) com até 255 caracteres.']; } else $url=null;
        return ['titulo'=>$titulo,'id_ano'=>$ano,'id_materia'=>$materia,'tipo'=>$tipo,'descricao'=>$descricao!==''?$descricao:null,'url_video'=>$url,'texto_conteudo'=>$texto!==''?$texto:null];
    }
}
