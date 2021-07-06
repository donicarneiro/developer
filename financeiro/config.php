<?php 

$nome_sistema = 'Financeiro Vip';
$url_sistema = 'http://localhost/financeiro/';
$email_adm = 'donizetti_carneiro@yahoo.com.br';
$nome_admin = 'Donizetti Carneiro';

$endereco_site = 'Rua Aurora Maria de Jesus, 40 - 38182-156-Araxá-MG';
$telefone_fixo = '(34) 36652-1363';
$telefone_whatsapp = '(34) 98862-1929';
$telefone_whatsapp_link = '5534988621929';
$cnpj_site = '212.562.336-68';

$rodape_relatorios = 'Desenvolvido para DC Consultoria@Todos os Direitos Reservados!!';

//DADOS PARA O BANCO DADOS LOCAL
$servidor = 'localhost';
$usuario = 'root';
$senha = '';
$banco = 'financeiro';



/*DADOS PARA O BANCO DADOS HOSPEDADO
$servidor = 'https://console.aws.amazon.com/rds/home?region=us-east-1#dbinstances:id=aaggszimvr41nd';
$usuario = 'admin';
$senha = 'Doni1062';
$banco = 'financeiro';
*/

//VARIAVEIS GLOBAIS
$nivel_minimo_estoque = 10;  // a partir de 10 produtos ele vai colocar o produto em alerta com estoque baixo.

//VARIAVEIS PARA CONTAS A RECEBER   OBS NAO COLOQUE % NOS VALORES
$valor_multa = 2; // esse valor de 2 corresponde a 2% sobre o valor da venda
$valor_juros_dia = 0.15; // aqui será 0.15 % ao dia sobre o valor da venda;
$dias_carencia = 0;

$frequencia_automatica = 'Não'; //Caso você utilize sim e tenha uma conta que foi lançada como mensal, todo mês será gerado uma nova conta independentemente se a anterior foi paga.


$relatorio_pdf = 'Sim'; //Se estiver sim o relatório vai sair em pdf, caso contrário será um relatório html.
 ?>