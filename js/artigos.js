//Inicializa script quando a página estiver pronta

$(document).ready(monitor);

//Aplicativo Principal

function monitor(){

    //Monitorar cliques no nome do autor
    $(document).on('click', '#mostraAutor', showAutor);    
}

//Exibe o modal do autor
function showAutor(){
    $('#modal').fadeIn('fast');
    return false;
}