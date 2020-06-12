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
$titulo = "Artigo";

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

//Obtém o ID do artigo selecionado direto da URL

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

//Se não tiver id, irá retornar para a listagem de artigos
if ($id == 0) header('Location: /artigos.php');

//Le o artigo do banco de dados

$sql = "SELECT * FROM `artigos` WHERE id_artigo = '{$id}' AND status = 'ativo'";

//Executa a Query
$res = $conn->query($sql);

//Obter os dados

$art = $res->fetch_assoc();

//DEBUG = print_r($art);

//Formatar artigo
$artigo = <<<HTML
    <h2>{$art['titulo']}</h2>
    <div>{$art['texto']}</div>

HTML;

//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require ('_header.php');

?> 

<?php echo $artigo ?>

<?php

// Template de fechamento - rodapé
require '_footer.php';

?>