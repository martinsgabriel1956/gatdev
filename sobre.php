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
$titulo = "Sobre";

/*
    $css --> Carrega o CSS adicional "desta" página.
    Se "", não carrega CSS adicional.
    Exemplo: /css/template.css
*/
$css = "";

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
$menu = "sobre";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////



//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require ('_header.php');

?> 

<h2>Sobre o Site</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>
<a href="http://luferat.net/">Site do Fessô</a>
<p lang="en">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel.</p>

<h2>Sobre o Autor</h2>
<p>Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>
<img class="responsivo" src="https://picsum.photos/400/300" alt="Imagem aleatória">

<h2>Sobre Sua Privacidade</h2> 
<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>
<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>

<?php

// Template de fechamento - rodapé
require ('_footer.php');

?>