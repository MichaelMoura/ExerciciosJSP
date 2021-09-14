<%@ page language="java" contentType="text/html; charset="UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	body,html{
		padding:0;
		box-sizing: border-box;
		margin:0;
		background: black;
		color: white;
	}
	
	h1, h3{
		text-transform: capitalize;
	}
	
	h3{
		color:red;
		font-size: 36px;
		padding: 0 20px;
	}
	
	body{
		height:100vh;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	
	main{
		display:flex;
		justify-content:center;
		flex-direction:column;
		padding: 5px;
		border:1px solid orange;
		max-width: 1000px;
	}
	
	div{
		display:flex;
		justify-content:center;
	}
	
	table td{
		padding:20px;	
	}
	
	table td{
		background-color:#ccc;
	}
	
	table tr td:nth-child(2n){
		background-color:orange;
	}
	
	
	
</style>
<body>

	<% String mes = request.getParameter("mes"); %>
	
	<main>
	
		<div>
			<h1>Mes de <%= mes %></h1>
		</div>
		
		
		<%!
	            public String gerarCalendario(int value){
	            	
	            	String tabela="";
	            	
	            	for(int i=1;i<=value;i++){					
						if(i==1){
							tabela+="<tr><td>" + i + "</td>";
						}else if((i%7)==0){
							tabela+="<td>" + i +"</td></tr>";
							tabela+="<tr>";
						}else if(i==value){
							tabela+="<td>" + i +"</td></tr>";
						}else{
							tabela+="<td>" + i + "</td>";
						}
	                }
	            	return tabela;
	            }
	    %>
	    
	    
	    <table>
			<tbody>
		<%
			if("jan".equals(mes) || "mar".equals(mes) || "mai".equals(mes) || "jul".equals(mes) || "ago".equals(mes) || "out".equals(mes) || "dez".equals(mes) ){
				out.println(gerarCalendario(31));
			}else if("fev".equals(mes)){
				out.println(gerarCalendario(28));
			}else if(mes==null){
				out.println("<h3>um momento, companheiro! Voc� n�o inseriu nenhum parametro</h3>");
			}else{
			
				out.println(gerarCalendario(30));
			}
		%>
			</tbody>
		</table>
	
	</main>
	
	
	
	
        
</body>
</html>
