<?php

/////////////////////////////////////////
// Configurações inicias da aplicação! //
/////////////////////////////////////////
require '_config.php';

///////////////////////////////////////
// Configurações iniciais da página! //
///////////////////////////////////////

/*
    $titulo --> Define o título "desta" página.
    Se = "", usa o título e o slogan do site.
*/
$titulo = "Artigos";

/*
    $css --> Carrega o CSS adicional "desta" página.
    Se "", não carrega CSS adicional.
    Exemplo: /css/template.css
*/
$css = "css/artigos.css";

/*
    $js --> Carrega o JavaScript adicional "desta" página.
    Se "", não usa JavaScript adicional.
    Exemplo: /js/template.js
*/
$js = "";

/*
    $menu --> Define o item ativo do menu "nesta" página.
    Se "", nenhum item será marcado.
    Valores possíveis: "", "artigos", "contatos", "sobre", "procurar", "noticias".
    Qualquer outro valor = "".
*/
$menu = "artigos";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////

//Query de consulta ao banco de dados
$sql = "SELECT id_artigo, titulo, imagem, resumo FROM artigos WHERE status = 'ativo' ORDER BY data DESC";

//Executa a Query

$res = $conn->query($sql); 

//Declara variável que exibe os artigos
$artigos = '';


//Loop para obter cada registro do banco de dados
while ($art = $res->fetch_assoc()) {
   
    //Cria a lista de artigos usando HEREDOC
    $artigos .= <<<HTML

<div class="artigo">
    <a href="artigo.php?id={$art['id_artigo']}"><img src="{$art['imagem']}" alt="{$art['titulo']}"></a>
    <a href="artigo.php?id={$art['id_artigo']}"><h4>{$art['titulo']}</h4></a>
    <span>{$art['resumo']}</span>
    <small><a href="artigo.php?id={$art['id_artigo']}">Ler mais...</a></small>

</div>

HTML;

}

/////Obtendo a lista de categorias /////

//Query de consulta ao banco de dados
$sql = "SELECT * FROM categorias ORDER BY nome";

//Executa a Query

$res = $conn->query($sql); 

//Declara variável que exibe os artigos
$categoria = '<ul>';

//Loop para obter cada registro do banco de dados
while ($cat = $res->fetch_assoc()) {

    //Conta o total de artigos nesta categoria

    $sql2 = "SELECT id_art_cat FROM art_cat WHERE categoria_id = {$cat['id_categoria']}";
    
    //Executa a Query
    $res2 = $conn->query($sql2);

    //Total de artigos
    $total = $res2->num_rows;

    //Só exibe categoria se existir artigo nela
    if ($total > 0) {
        //Cria lista de categorias com HEREDOC
        $categoria .= <<<HTML
        <li><a href="artigos.php?c={$cat['id_categoria']}">{$cat['nome']}</a><small><sup>{$total}</sup></small></li>    

HTML;
    }
}

//Fecha a lista aberta na declaração



$categoria .= '</ul>';

//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require '_header.php';

?> 

<h2>Artigos Recentes</h2>
<small class="subtitulo">Mais recentes primeiro.</small>

<div class="row">
    <div class="col1"><?php echo $artigos ?></div>
    <aside class="col2">
        <h3>Categorias</h3>
        <?php echo $categoria ?>
    </aside>
</div>

<?php

// Template de fechamento - rodapé
require '_footer.php';

?>