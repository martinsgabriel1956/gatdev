// Inicializa script quando a página estiver pronta
$(document).ready(monitor);

// Aplicativo principal
function monitor() {

    // Monitorar cliques no nome do autor
    $(document).on('click', '#mostraAutor', showAutor);

    // Fechar modal
    $(document).on('click', '.modal-box', hideAutor)
}

// Exibe o modal do autor
function showAutor() {
    $('#modal').fadeIn('fast');
    return false;
}

// Oculta o modal do autor
function hideAutor() {
    $('#modal').fadeOut('fast');
    return false;
}