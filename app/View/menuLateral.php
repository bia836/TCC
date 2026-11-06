<?php
$paginaAtual = $paginaAtual ?? "home";
$ehAtual = fn(string $pagina): bool => $paginaAtual === $pagina;
?>
<nav class="menuLateral" aria-label="Menu principal">

    <!-- HOME -->
    <a class="itemMenu<?= $ehAtual("home") ? " selecionado" : "" ?> comSeparador" href="/TCC/public/home"
       aria-label="Home"<?= $ehAtual("home") ? ' aria-current="page"' : "" ?>>
        <i class="bx bx-home-alt" aria-hidden="true"></i>
        <span class="itemTexto">Home</span>
    </a>

    <!-- ATIVIDADES -->
    <a class="itemMenu<?= $ehAtual("atividades") ? " selecionado" : "" ?> comSeparador" href="/TCC/public/atividades"
       aria-label="Atividades"<?= $ehAtual("atividades") ? ' aria-current="page"' : "" ?>>
        <i class="bx bx-book-open" aria-hidden="true"></i>
        <span class="itemTexto">Atividades</span>
    </a>

    <!-- PERFIL -->
    <a class="itemMenu<?= $ehAtual("perfil") ? " selecionado" : "" ?> comSeparador" href="/TCC/public/perfil"
       aria-label="Perfil"<?= $ehAtual("perfil") ? ' aria-current="page"' : "" ?>>
        <i class="bx bxs-user-circle" aria-hidden="true"></i>
        <span class="itemTexto">Perfil</span>
    </a>

</nav>
