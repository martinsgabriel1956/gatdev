<?php
// Usar PHP e tudo mais em UTF-8 (evita problemas de acentuação)
header("Content-type: text/html; charset=utf-8");

// Dados de conexão com o banco de dados MySQL (CUIDADO!)
$servidor = 'localhost'; // endereço do servidor MySQL
$database = 'gatolandia'; // nome do banco de dados
$usuario = 'root'; // nome do usuário do banco de dados
$senha = ''; // senha do usuário do banco de dados

// Conexão com o MySQL --> OO   ┌───> Parâmetros construtores do objeto
$conn = new mysqli($servidor, $usuario, $senha, $database);
if ($conn->connect_error) die("Falha de conexão com o banco e dados: " . $conn->connect_error);

/***** DB COM UTF-8 *****/
$conn->query("SET NAMES 'utf8'");
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');

// MySQL com nomes de dias da semana e meses em português
$conn->query('SET GLOBAL lc_time_names=pt_BR');
$conn->query('SET lc_time_names = pt_BR');
