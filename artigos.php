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
$titulo = "Artigos Recentes";

/*
$css --> Carrega o CSS adicional "desta" página.
Se "", não carrega CSS adicional.
Exemplo: /css/template.css
 */
$css = "/css/artigos.css";

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

// Capturar o ID da URL
$idcat = (isset($_GET['c'])) ? intval($_GET['c']) : 0;

// DEBUG: print_r($idcat); exit();

// Se pediu uma categoria, obtém artigos desta categoria
if ($idcat > 0) {

    $sql = <<<SQL
SELECT id_artigo, titulo, imagem, resumo, id_categoria, nome FROM artigos
    INNER JOIN art_cat ON artigo_id = id_artigo
    INNER JOIN categorias ON categoria_id = id_categoria
WHERE categoria_id = '{$idcat}' AND status = 'ativo' 
    ORDER BY data DESC
SQL;

    // Se pediu todos os artigos
} else {

    // Query de consulta ao banco de dados
    $sql = "SELECT id_artigo, titulo, imagem, resumo FROM artigos WHERE status = 'ativo' ORDER BY data DESC";

}

// Executa a query
$res = $conn->query($sql);

// Declara variável que exibe os artigos
$artigos = '';

// Se existem artigos a serem exibidos
if ($res->num_rows > 0) {

    // Loop para obter cada registro do banco de dados
    while ($art = $res->fetch_assoc()) {

        // Cria a lista de artigos usando HEREDOC
        $artigos .= <<<HTML
<div class="artigo">
    <a href="artigo.php?id={$art['id_artigo']}"><img src="{$art['imagem']}" alt="{$art['titulo']}"></a>
    <a href="artigo.php?id={$art['id_artigo']}"><h4>{$art['titulo']}</h4></a>
    <span>{$art['resumo']}</span>
    <small><a href="artigo.php?id={$art['id_artigo']}">Ler mais...</a></small>
</div>
HTML;

        // Acrescenta nome da categoria no titulo
        if ($idcat > 0) {
            $titulo = "Artigos Recentes em \"{$art['nome']}\"";
        }
    } // end while

    // Se não existem artigos
} else {

    $artigos = '<p class="center">Nenhum artigo encontrado!</p>';
}

// Título da página = título do HTML
$cattitulo = $titulo;

///// Obtendo lista de Categorias /////

// Query de consulta ao banco de dados
$sql = "SELECT * FROM categorias ORDER BY nome";

// Executa a query
$res = $conn->query($sql);

// Declara variável que exibe as categorias
$categorias = '<ul>';

// Loop para obter cada registro do banco de dados
while ($cat = $res->fetch_assoc()) {

    // Conta o total de artigos nesta categoria
    $sql2 = "SELECT id_art_cat FROM `art_cat` WHERE categoria_id = {$cat['id_categoria']}";

    // DEBUG: print_r($sql2); echo "\n";

    // Executa aquery
    $res2 = $conn->query($sql2);

    // Total de artigos
    $total = $res2->num_rows;

    // Só exibe categoria se tiver artigo nela
    if($total > 0) {
        // Cria a lista de categorias usando HEREDOC
        $categorias .= <<<HTML
        <li><a href="artigos.php?c={$cat['id_categoria']}">{$cat['nome']}</a> <small><sup>{$total}</sup></small></li>
HTML;
    }
}

// Fecha a lista aberta na declaração
$categorias .= '</ul>';

//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require '_header.php';

?>

<div class="row">

    <div class="col1">
        <h2><?php echo $cattitulo ?></h2>
        <small class="subtitulo">Mais recentes primeiro.</small>
        <?php echo $artigos ?>
    </div>
    <aside class="col2">
        <h3>Categorias</h3>
        <?php echo $categorias ?>
    </aside>

</div>

<?php

// Template de fechamento - rodapé
require '_footer.php';

?>
