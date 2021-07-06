<?php 
require_once("../conexao.php");
require_once("verificar.php");
$pagina = 'vendas';

//datas prazo
$data_atual = date('Y-m-d');
$data30 = date('Y-m-d', strtotime("+1 month",strtotime($data_atual)));
$data60 = date('Y-m-d', strtotime("+2 month",strtotime($data_atual)));
$data90 = date('Y-m-d', strtotime("+3 month",strtotime($data_atual)));
?>
<link rel="stylesheet" type="text/css" href="../css/tela-venda.css">
<div class="row my-2">

	<div class='checkout'>
		<div class="row">
			<div class="col-md-4 col-sm-12">
				<div class='order py-2'>
					<p class="background">LISTA DE ITENS : CLIENTE <span id="nome-cliente-label"></span> 

					</p>

					<span id="listar-itens">

					</span>


				</div>
			</div>



			<div id='payment' class='payment col-md-7 py-2 mx-4'>


				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<a class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#dados" type="button" role="tab" aria-controls="home" aria-selected="true">Clientes</a>
					</li>
					<li class="nav-item" role="presentation">
						<a class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#contas" type="button" role="tab" aria-controls="profile" aria-selected="false">Produtos</a>
					</li>

				</ul>

				<hr>

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="dados" role="tabpanel" aria-labelledby="home-tab">

						<div class="row mb-4">
							<div class="col-md-1">
								<input type="text" class="form-control form-control-sm" name="<?php echo $campo2 ?>"  id="id-cliente" placeholder="Id" readonly>
							</div>

							<div class="col-md-3">
								<input type="text" class="form-control form-control-sm" name="nome-cliente"  id="nome-cliente" placeholder="Nome Cliente" readonly>
							</div>
						</div>

						<small>
							<div id="listar-clientes"></div>
						</small>



					</div>

					<div class="tab-pane fade" id="contas" role="tabpanel" aria-labelledby="profile-tab">


						<small>
							<div id="listar-produtos"></div>
						</small>



					</div>
					<br>
					<small>
						<div id="mensagem-itens"></div>
					</small>
				</div>

				


			</div>


		</div>
	</div>


</div>




<!-- Modal -->
<div class="modal fade" id="modalVenda" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"><span id="tituloModal">Fechar Venda - Total: <span id="total-da-venda"></span></span></h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="form-venda" method="post">
				<div class="modal-body">


						<div class="row">
					<div class="col-md-3">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Desconto</label>
							<input onkeyup="totalizarVenda()" type="text" class="form-control" name="desconto" placeholder="Desconto" id="desconto">
						</div>
					</div>
					<div class="col-md-3">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Acréscimo</label>
							<input onkeyup="totalizarVenda()" type="text" class="form-control" name="acrescimo" placeholder="Acréscimo" id="acrescimo">
						</div>
					</div>
					<div class="col-md-3">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">SubTotal</label>
							<input type="text" class="form-control" name="subtotal" placeholder="SubTotal" id="subtotal" readonly="">
						</div>
					</div>
					<div class="col-md-3">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Parcelas</label>
							<input onkeyup="criarParcelas()" type="number" class="form-control" name="parcelas" placeholder="Total Parcelas" id="parcelas" required value="1">
						</div>
					</div>
				</div>


					<div class="row">
						<div class="col-md-4">
							<div class="mb-3"><small>
								<label for="exampleFormControlInput1" class="form-label">Data (<a title="Lançar Venda para 30 Dias" href="#" onclick="mudarData('<?php echo $data30 ?>')" class="text-dark">30 Dias</a> / <a title="Lançar Venda para 60 Dias" href="#" onclick="mudarData('<?php echo $data60 ?>')" class="text-dark">60 Dias</a> / <a title="Lançar Venda para 90 Dias" href="#" onclick="mudarData('<?php echo $data90 ?>')" class="text-dark">90 Dias</a>)</label>
								<input type="date" class="form-control" name="data"  id="data" value="<?php echo date('Y-m-d') ?>" required>
							</small>
						</div>
					</div>


					<div class="col-md-4 col-sm-12">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Tipo Entrada</label>
							<select class="form-select" aria-label="Default select example" name="lancamento" id="lancamento">
								<option value="Caixa">Caixa (Movimento)</option>
								<option value="Cartão de Débito">Cartão de Débito</option>
								<option value="Cartão de Crédito">Cartão de Crédito</option>

								<?php 
								$query = $pdo->query("SELECT * FROM bancos order by nome asc");
								$res = $query->fetchAll(PDO::FETCH_ASSOC);
								for($i=0; $i < @count($res); $i++){
									foreach ($res[$i] as $key => $value){	}
										$id_item = $res[$i]['id'];
									$nome_item = $res[$i]['nome'];
									?>
									<option value="<?php echo $nome_item ?>"><?php echo $nome_item ?></option>

								<?php } ?>


							</select>
						</div>
					</div>

					<div class="col-md-4 col-sm-12">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Pagamento</label>
							<select class="form-select" aria-label="Default select example" name="pagamento" id="pagamento">
								<option value="Dinheiro">Dinheiro</option>
								<option value="Boleto">Boleto</option>
								<option value="Cheque">Cheque</option>
								<option value="Conta Corrente">Conta Corrente</option>
								<option value="Conta Poupança">Conta Poupança</option>
								<option value="Carnê">Carnê</option>
								<option value="Depósito">Depósito</option>
								<option value="Transferência">Transferência</option>
								<option value="Pix">Pix</option>
							</select>
						</div>
					</div>

				</div>

				<small class="mt-3"><div id="listar-parcelas">

				</div></small>


				<small><div id="mensagem" align="center"></div></small>

				<input type="hidden" name="id-cli"  id="id-cli">


			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn-fechar">Fechar</button>
				<button type="submit" class="btn btn-success">Finalizar</button>
			</div>
		</form>
	</div>
</div>
</div>



<script type="text/javascript">var pag = "<?=$pagina?>"</script>
<script src="../js/ajax.js"></script>

<script>
	$(document).ready(function() {
		listarClientes();
		listarProdutos();
		listarItens();
		limparCampos();
	});


	function listarClientes(){
		var pag = "<?=$pagina?>";
		$.ajax({
			url: pag + "/listar-clientes.php",
			method: 'POST',
			data: $('#form').serialize(),
			dataType: "html",

			success:function(result){
				$("#listar-clientes").html(result);
			}
		});
	}


	function listarProdutos(){

		var pag = "<?=$pagina?>";
		$.ajax({
			url: pag + "/listar-produtos.php",
			method: 'POST',
			data: $('#form').serialize(),
			dataType: "html",

			success:function(result){
				$("#listar-produtos").html(result);
			}
		});
	}


	function listarItens(){

		var pag = "<?=$pagina?>";
		$.ajax({
			url: pag + "/listar-itens.php",
			method: 'POST',
			data: $('#form').serialize(),
			dataType: "html",

			success:function(result){
				$("#listar-itens").html(result);
			}
		});
	}


	function excluirItem(id){

		event.preventDefault();
		$.ajax({
			url: "vendas/excluir-item.php",
			method: 'POST',
			data: {id},
			dataType: "text",

			success: function (mensagem) {
				$('#mensagem-itens').text('');
				$('#mensagem-itens').removeClass()
				if (mensagem.trim() == "Excluído com Sucesso") {

					listarItens();
					listarProdutos();

				}else{
					$('#mensagem-itens').addClass('text-danger')
					$('#mensagem-itens').text(mensagem)
				}               
			},

		});
	}


	function ModalFecharVenda(){
		$('#mensagem-fec').text('');
		$('#mensagem-fec').removeClass();
		var idCli = $('#id-cliente').val();
		$('#id-cli').val(idCli);
		listarParcelas();



		if($('#nome-cliente').val() == ""){
			$('#mensagem-fec').addClass('text-danger')
			$('#mensagem-fec').text('Selecione um Cliente');

			//DEFINIR ABA A SER ABERTA
			var someTabTriggerEl = document.querySelector('#home-tab')
			var tab = new bootstrap.Tab(someTabTriggerEl);
			tab.show();

		}else{
			var myModal = new bootstrap.Modal(document.getElementById('modalVenda'), {   
				
			    });
			myModal.show();
			
			
		}
	}


	function mudarData(data){
		$("#data").val(data);
		criarParcelas();
	}




	$("#form-venda").submit(function () {
		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: pag + "/inserir.php",
			type: 'POST',
			data: formData,

			success: function (mensagem) {
				$('#mensagem').text('');
				$('#mensagem').removeClass()
				var array = mensagem.split("-");
				if (array[0] == "Salvo com Sucesso") {
                    //$('#nome').val('');
                    //$('#cpf').val('');
                    $('#btn-fechar').click();
                    limparCampos();

                     let a= document.createElement('a');
         			 a.target= '_blank';
          			 a.href= '../relatorios/venda_class.php?id=' + array[1];
          			 a.click();

                } else {

                	$('#mensagem').addClass('text-danger')
                	$('#mensagem').text(mensagem)
                }


            },

            cache: false,
            contentType: false,
            processData: false,
            
        });

	});


	function limparCampos(){
		listarItens();
		$('#id-cliente').val('1');
		$('#nome-cliente-label').text('Diversos');
		$('#nome-cliente').val('Diversos');
		$('#mensagem').text('');

	//DEFINIR ABA A SER ABERTA
	var someTabTriggerEl = document.querySelector('#home-tab')
	var tab = new bootstrap.Tab(someTabTriggerEl);
	tab.show();
}


function criarParcelas(){

	valor = $('#subtotal').val();
	parcelas = $('#parcelas').val();
	data = $('#data').val();

	
	 $.ajax({
        url: pag + "/parcelas.php",
        method: 'POST',
        data: {valor, parcelas, data},
        dataType: "text",

        success: function (mensagem) {
            if (mensagem.trim() == "Inserido com Sucesso") {
                listarParcelas();
            }               
        },

    });
}



function listarParcelas(){

	$('#mensagem').text('');

		var pag = "<?=$pagina?>";
		$.ajax({
			url: pag + "/listar-parcelas.php",
			method: 'POST',
			data: $('#form').serialize(),
			dataType: "html",

			success:function(result){
				$("#listar-parcelas").html(result);
			}
		});
	}

</script>



<script type="text/javascript">
  $(document).keypress(function(e) {
    if(e.which == 13){
      ModalFecharVenda();
    }
});
</script>
