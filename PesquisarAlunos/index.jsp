<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="index.jsp">
		<label>
			<span>Digite um nome ou RGM</span>
			<input type="text" name="valor"/>
		</label>
		<div>
			<h4>Digite o tipo de busca</h4>
			<label>
				<input type="radio" name="pesquisa" value="nome"/>
				<span>Nome</span>
			</label>
			<label>
				<input type="radio" name="pesquisa" value="rgm"/>
				<span>RGM</span>
			</label>
		</div>
		<button>Pesquisar</button>
	</form>
	
	<%!
	String alunos[][] = 
	{
		{"12345", "Juliano Lopes", "Rua Lima, 722", "12/06/85", "ADS", "juliol@gmail.com"},
		{"32132", "Ana Silveira", "Rua Pedroso, 31", "15/09/82", "CCP", "ana2silv@ig.com.br"},
		{"45455", "Filiberto Alves", "Av. Verde, 722", "07/11/76", "ARQ", "filialv@yahoo.com"},
		{"31587", "Michael Fernandes", "Rua Fulano, 333", "20/12/2000", "ADS", "michael@gmail.com"},
		{"65325", "Jorge Jesus", "Rua Flamengo, 87", "20/01/1985", "FUT", "jorgejesus@flamengo.com"},
		{"89582", "Zinedi Zidane", "Rua Real Madrid, 789", "02/04/1973", "FUT", "zinedizidane@real.com"},
		{"43665", "Frederico Lasco", "Rua do Boemio, 556", "03/06/1963", "HIS", "fredericolasco@.com"},
		{"34523", "Romero Brito", "Rua do Pintor, 553", "05/06/1989", "ART", "romerobrito@gmail.com"},
		{"23435", "Fulano de tal", "Rua do Fulano, 353", "31/10/1999", "GEO", "fulano@outlook.com"},
		{"51455", "Amado Batista", "Rua do Cantor, 343", "02/05/1969", "MUS", "amadobatista@bol.com"},
		{"97697", "Benedito Silva", "Rua do Benedito, 834", "02/05/2003", "SDI", "benedito@protonmail.com"},
	};
	
	String aluno[] = new String[6];
	%>
	
	<%
		String valor = request.getParameter("valor");
		String tipoPesquisa = request.getParameter("pesquisa");
		Boolean encontrado=false;
		//O padrao que deve ser buscado e nao deve diferenciar as maiusculas das minusculas
		
		if("nome".equals(tipoPesquisa)){
			Pattern pattern = Pattern.compile(valor);
			for(int linha=0;linha<10;linha++){
				Matcher matcher = pattern.matcher(alunos[linha][1]);
				if(matcher.find()){
					encontrado=true;
					for(int i=0;i<6;i++){
						out.println(alunos[linha][i]);
					}
				}
			}
			if(encontrado==false){
				out.println("<h1>Nome nao encontrado</h1>");
			}
			
		}
		else if("rgm".equals(tipoPesquisa)){
			for(int linha=0;linha<10;linha++){
				if(alunos[linha][0].equals(valor)){
					encontrado=true;
					for(int i=0;i<6;i++){
						out.println(alunos[linha][i]);
					}
				}
			}
			if(encontrado==false){
				out.println("<h1>RGM n�o encontrado</h1>");
			}
		}
	%>
	
</body>
</html>
