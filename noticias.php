<?php

/////////////////////////////////////////
// Configurações inicias da aplicação! //
/////////////////////////////////////////
require ('_config.php');

///////////////////////////////////////
// Configurações iniciais da página! //
///////////////////////////////////////

/*
    $titulo --> Define o título "desta" página.
    Se = "", usa o título e o slogan do site.
*/
$titulo = "Notícias sobre gatos";

/*
    $css --> Carrega o CSS adicional "desta" página.
    Se "", não carrega CSS adicional.
    Exemplo: /css/template.css
*/
$css = "css/noticias.css";

/*
    $js --> Carrega o JavaScript adicional "desta" página.
    Se "", não usa JavaScript adicional.
    Exemplo: /js/template.js
*/
$js = "js/noticias.js";

/*
    $menu --> Define o item ativo do menu "nesta" página.
    Se "", nenhum item será marcado.
    Valores possíveis: "", "artigos", "contatos", "sobre", "procurar", "noticias".
    Qualquer outro valor = "".
*/
$menu = "noticias";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////

// Obtendo artigos aleatórios
$sql = "SELECT id_artigo, imagem, titulo FROM `artigos` WHERE status = 'ativo' ORDER BY RAND() LIMIT 3;";
$res = $conn->query($sql);

// Loop de exibição
$artigos = '';
while ($art = $res->fetch_assoc()) :

    $artigos .= <<<HTML
<div class="art">
<a href="/artigo.php?id={$art['id_artigo']}">
    <img src="{$art['imagem']}" alt="{$art['titulo']}" title="{$art['titulo']}">    
    {$art['titulo']}
</a>
</div>
HTML;

endwhile;
$artigos .= '';


//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require ('_header.php');

?> 

<div class="row">
    <div class="col1">
        <h2>Notícias da Gatolândia</h2>
        <p>Últimas notícias do Brasil e do mundo sobre felinos e pets em geral.</p>
        <div id="news"></div>
    </div>
    <aside class="col2">
        <h3>Artigos</h3>
        <?php echo $artigos ?>
    </aside>
</div>

<?php

// Template de fechamento - rodapé
require ('_footer.php');

?>