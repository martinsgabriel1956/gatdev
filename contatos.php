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
$titulo = "Faça Contato";

/*
    $css --> Carrega o CSS adicional "desta" página.
    Se "", não carrega CSS adicional.
    Exemplo: /css/template.css
*/
$css = "/css/contatos.css";

/*
    $js --> Carrega o JavaScript adicional "desta" página.
    Se "", não usa JavaScript adicional.
    Exemplo: /js/template.js
*/
$js = "/js/contatos.js";

/*
    $menu --> Seleciona o item ativo do menu "nesta" página.
    Se "", nenhum item será marcado.
    Valores possíveis: "", "artigos", "contatos", "sobre", "procurar", "noticias".
    Qualquer outro valor = "".
*/
$menu = "contatos";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////

// Declara variáveis
$nome = $email = $assunto = $mensagem = $erro = $msgerro = $msgok = '';

// Processa o form
if (isset($_POST['enviando'])) :

    // Obtendo valores dos campos
    $nome = trim(filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_STRING));
    $email = trim(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL));
    $assunto = trim(filter_input(INPUT_POST, 'assunto', FILTER_SANITIZE_STRING));
    $mensagem = trim(filter_input(INPUT_POST, 'mensagem', FILTER_SANITIZE_STRING));

    // Validar nome
    if (strlen($nome) < 2) {
        $erro .= '<li>Seu nome está muito curto;</li>';
    }

    // Validar e-mail
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erro .= '<li>Seu e-mail está inválido;</li>';
    }

    // Validar assunto
    if (strlen($assunto) < 4) {
        $erro .= '<li>O assunto está muito curto;</li>';
    }

    // Validar mensagem
    if (strlen($mensagem) < 4) {
        $erro .= '<li>A mensagem está muito curta;</li>';
    }

    // Processar erros
    if ($erro != '') :

        // Cria mensagem de erro
        $msgerro = <<<HTML
<div class="msg msgphp">
    <h3>Ooooops!</h3>
    Ocorreram erros no preenchimento do formulário:
    <ul>{$erro}</ul>
    Por favor, corrija e tente novamente.   
</div>
HTML;

    else :

        // Query de gravação do contato no db
        $sql = "

INSERT INTO contatos (
    nome,
    email,
    assunto,
    mensagem
) VALUES (
    '{$nome}',
    '{$email}',
    '{$assunto}',
    '{$mensagem}'
);

";        
        // Executa a query acima
        if($conn->query($sql)) :

            // Enviar por e-mail ao admin do site
            @mail('admin@gatolandia.com', 'Novo contato', "Olá!\n\nUm novo contato foi enviado para o Gatolândia.\n\nObrigado.");

            // Primeiro no do remetente
            $n = explode(' ', $nome);

            // Mensagem de agradecimento
            $msgok = <<<HTML
<div class='msgok'>
    <h3>Olá {$n[0]}!</h3>
    <p>Seu contato foi enviado para a equipe do site.</p>
    <em>Obrigado...</em>

    <p class="center"><a href="/">Ir para a página inicial</a></p>
</div>
HTML;

            // Reset das variáveis
            $nome = $email = $assunto = $mensagem = '';

        else:

            die('Falha ao enviar seu contato. Tente mais tarde.');

        endif;

    endif;

endif;

//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require('_header.php');

?>

<div class="row">
    <div class="col1">

        <h2>Faça Contato</h2>

<?php

    if ($msgok != ''):

        echo $msgok;

    else :

?>

        <p>Preencha o formulário abaixo para entrar em contato com a equipe do Gatolândia.</p>

        <div id="msgerro" class="msg"></div>

<?php

    if ($msgerro != ''):

        echo $msgerro;

    endif;

?>

        <form action="<?php echo $_SERVER['PHP_SELF'] ?>" class="contatos" id="contatos" method="post">
            <input type="hidden" name="enviando" value="ok">
            <p>
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" placeholder="Seu nome completo" value="<?php echo $nome ?>">
            </p>
            <p>
                <label for="email">E-mail:</label>
                <input type="text" name="email" id="email" placeholder="Seu e-mail. Ex: usuario@provedor.com" value="<?php echo $email ?>">
            </p>
            <p>
                <label for="assunto">Assunto:</label>
                <input type="text" name="assunto" id="assunto" placeholder="Assunto da mensagem" value="<?php echo $assunto ?>">
            </p>
            <p>
                <label for="mensagem">Mensagem:</label>
                <textarea name="mensagem" id="mensagem" placeholder="Sua mensagem"><?php echo $mensagem ?></textarea>
            </p>
            <p>
                <label></label>
                <button type="submit" id="enviar">Enviar</button>
                <small>&larr; Clique somente uma vez.</small>
            </p>
        </form>

<?php endif; ?>

    </div>
    <div class="col2">

        <h3>Mais contatos</h3>
        <img src="/img/social01.jpg" alt="Mais contatos">
        <p>Você também pode falar conosco pelas redes sociais:</p>
        <ul>
            <li><a href="http://facebook.com/" target="_blank"><i class="fab fa-fw fa-facebook-square"></i> Facebook</a></li>
            <li><a href="http://youtube.com/" target="_blank"><i class="fab fa-fw fa-youtube-square"></i> Youtube</a></li>
            <li><a href="http://linkedin.com/" target="_blank"><i class="fab fa-fw fa-linkedin"></i> Linkedin</a></li>
            <li><a href="http://twitter.com/" target="_blank"><i class="fab fa-fw fa-twitter-square"></i> Twitter</a></li>
            <li><a href="http://instagram.com/" target="_blank"><i class="fab fa-fw fa-instagram"></i> Instagram</a></li>
        </ul>

    </div>
</div>

<?php

// Template de fechamento - rodapé
require('_footer.php');

?>