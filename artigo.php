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
$js = "js/artigos.js";

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

$sql = "SELECT *, DATE_FORMAT(data, '%d de %M de %Y') AS databr FROM `artigos` WHERE id_artigo = '{$id}' AND status = 'ativo'";

//Executa a Query
$res = $conn->query($sql);

//Verifica se artigo existe realmente. Se não existir, volta para a listagem de artigos
if($res->num_rows < 1){
    header('Location: /artigos.php');
} //num_rows == conta quantos elementos vieram do banco de dados



//Obter os dados
$art = $res->fetch_assoc();

//Obtém dados do autor
$sql = "SELECT *, TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS idade FROM `autores` WHERE `id_autor` = '{$art['autor_id']}'";
$res = $conn->query($sql);
$autor = $res->fetch_assoc();

//DEBUG: print_r($autor); exit();


//Troca o título da pagina (tag Title)
$titulo = $art['titulo'];


//DEBUG = print_r($art);

//Formatar artigo
$artigo = <<<HTML
    
    <h2>{$art['titulo']}</h2>
    <small class='subtitulo'>Por <a href="#" id="mostraAutor">{$autor['apelido']}</a> em {$art['databr']}</small>
    <div>{$art['texto']}</div>

    <div id="modal">
        <div class="modal-box">
            <div class="modal-body">
                <span class="close-modal"><i class="fas fa-times"></i></span>
                <img src="{$autor['foto']}" alt="{$autor['nome']}" title="{$autor['nome']}">
                <h3>{$autor['nome']}</h3>
                <small>{$autor['email']} - {$autor['idade']} anos</small>
                <p>{$autor['resumo']}</p>
                <hr>
                <a href="#fechar" class="close-modal">Fechar</a>
            </div>
        </div>
    </div>

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