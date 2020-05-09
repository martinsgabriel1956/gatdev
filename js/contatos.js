/* Processa formulário de contatos no front-end */

// Executa a aplicação quando o documento estiver pronto
$(document).ready(formApp);

// Aplicação principal dos contatos
function formApp() {

    // Quando o form for enviado
    $(document).on('submit', '#contatos', processForm);

}

// Processa o formulário
function processForm(e) {

    // Bloqueia o clique no botão
    $('#enviar').attr('disabled', true);

    // Variáveis globais do programa
    var nome = email = assunto = mensagem = erro = msgerro = '';

    ///// Obter os dados dos campos /////
    nome = sanitizeName($('#nome').val());
    email = sanitize($('#email').val());
    assunto = sanitize($('#assunto').val());
    mensagem = sanitize($('#mensagem').val());

    ///// Atualiza campos do formulário
    $('#nome').val(nome);
    $('#email').val(email);
    $('#assunto').val(assunto);
    $('#mensagem').val(mensagem);

    ///// Validar cada campo /////

    // Nome deve ter pelo menos 2 caracteres
    if (nome.length < 2) {
        erro += '<li>Seu nome está muito curto;</li>';
    }

    // Email deve ter um formato padrão
    if (!isMailSimple(email)) {
        erro += '<li>Seu e-mail está inválido;</li>';
    }

    // Assunto deve ter pelo menos 4 caracteres
    if (assunto.length < 4) {
        erro += '<li>O assunto está muito curto;</li>';
    }

    // Mensagem deve ter pelo menos 4 caracteres
    if (mensagem.length < 4) {
        erro += '<li>A mensagem está muito curta;</li>';
    }

    ///// Processar erros
    if (erro != '') {
        // Ocorreram erros
        msgerro += `
<h3>Ooooops!</h3>
Ocorreram erros no preenchimento do formulário:
<ul>${erro}</ul>
Por favor, corrija e tente novamente.        
        `;

        // Escreve o erro na tela
        $('#msgerro').html(msgerro);

        // Mostra a caixa de erro
        $('#msgerro').css('display', 'table');

        // Desbloquear o clique no botão
        $('#enviar').attr('disabled', false);

        // bloque ação normal do HTML
        return false;

    } else {

        // Envia o formulário
        return true;

    }

}

// Sanitiza os dados de cada campo
function sanitize(fieldValue) {

    // Remover espaços antes e depois da string
    fieldValue = fieldValue.trim();

    // Limpa espaços duplicados dentro da string
    while (fieldValue.indexOf('  ') != -1) {
        fieldValue = fieldValue.replace('  ', ' ');
    }

    // Retorna com os dados sanitizados
    return fieldValue;

}

// Sanitiza strings como nomes
function sanitizeName(fieldValue) {

    // Remove caracteres estranhos a um nome próprio
    fieldValue = fieldValue.replace(/[|&;$%@¨#!*_"<>()+,]/g, "");

    // Sanitiza espaços
    fieldValue = sanitize(fieldValue);

    // Retorna com os dados sanitizados
    return fieldValue;

}

// Função para validar um endereço de e-mail(usando expressão regular e match())
function isMail(fieldValue) {
    if (fieldValue.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]{2,}$/)) {
        return true;
    }
    return false;
}

// Função para validar e-mail de forma estruturada (a@b)
function isMailSimple(stringMail) {

    parts = stringMail.split('@'); // Deve ter o '@'
    if (parts.length != 2) return false; // Deve ter apenas 1 '@'
    if (parts[0].length < 1) return false; // Deve ter pelo menos 1 caracter antes do '@'
    if (parts[1].length < 1) return false; // Deve ter pelo menos 1 caracter depois do '@'
    return true; // Se está tudo correto

}