// Controle do menu principal e outras funções

// Executa aplicação quando documento estiver pronto
$(document).ready(runApp);

// Aplicação principal
function runApp() {

    // Monitora cliques no botão menu
    $(document).on('click', '#menu', menuToggle);

    // Monitora mudanças na largura da tela
    $(window).resize(menuChange);

}

// Mostra / oculta menu responsivo
function menuToggle() {

    // Se o menu responsivo é visível:
    if ($('#menulinks').is(':visible')) {
        // Oculta o menu responsivo
        menuHide('fast');
    // Senão:
    } else {
        // Mostra o menu responsivo
        menuShow('fast');
    }

    // Retorna ao documento sem fazer mais nada
    return false;

}

// Oculta o menu responsivo
function menuHide(vel) {

    // Esconde o menu responsivo
    $('#menulinks').slideUp(vel);

    // Mostra o ícone "☰" no botão do menu
    $('#menu i').addClass('fa-bars');

    // Oculta o ícone de "X" no botão do menu
    $('#menu i').removeClass('fa-times');

    // Remove a classe 'active'
    $('#menu').removeClass('active');

}

// Mostra o menu responsivo
function menuShow(vel) {

    // Mostra o menu responsivo
    $('#menulinks').slideDown(vel);

    // Mostra o ícone "X" no botão do menu
    $('#menu i').addClass('fa-times');

    // Oculta o ícone "☰" no botão do menu
    $('#menu i').removeClass('fa-bars');

    // Adiciona a classe 'active'
    $('#menu').addClass('active');

}

// Ajusta o menu conforme a largura da viewport
function menuChange() {

    // Se a viewport for maior que 640px:
    if (window.innerWidth > 574) {
        // Mostra o menu responsivo
        menuShow(0);
    // Senão:
    } else {
        // Oculta o menu responsivo
        menuHide(0);
    }

}

// Atalho para "console.log()"
function _(txtMsg) {
    console.log(txtMsg);
}

// Exibe notícias
function showNews(htmlElement, totalItems, keyWord) {
    $(htmlElement).rss('https://news.google.com/rss/search?q=' + keyWord + '&hl=pt-BR', {
        limit: totalItems,
        layoutTemplate: '<ul>{entries}</ul>',
        entryTemplate: '<li><a href="{url}" target="_blank">{title}</li>'
    });
}