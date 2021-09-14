<%-- 
    Document   : index
    Created on : 04/09/2021, 13:25:10
    Author     : pc
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        
        body{
            height:100%;
        }
        section{
            width: 50%;  
            float: left;
            padding: 0 20px;
        }
        
        section:after{
            clear: both;
        }
        
        h3>span{
            font-weight: 500;
        }
        
        div{
            margin: 10px 0;
        }
        
        .center{
            width: 100%;
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }
        
        ul{
            margin: 15px 0;
            padding-left: 20px; 
        }
    </style>
    
    <body>
        <div class='center'>
            <div>
                <h1>Formulário Escolar</h1>
                <h2>Por favor, preencha as informações abaixo</h2>
            </div>
        </div>
        <section>
            <form method="POST" action="index.jsp">

                <div>
                    <span>Nome: </span><input type="text" name="nome"/>
                </div>

                <div>
                    <h3>Onde você mora</h3>
                    <label>
                        <input type="radio" name="bairro"  value="af" />
                        <span>Anália Franco</span>
                    </label>
                    <label>
                        <input type="radio" name="bairro" value="smp" />
                        <span> São Miguel Paulista </span>
                    </label>
                </div>

                <div>
                    <h3>Semestre Atual</h3>
                    <select name='semestre'>
                        <option></option>
                        <%
                            for(int i=1;i<=8;i++){
                        %>
                            <option value=<%=i%>><%=i%>º Semestre</option>
                        <% 
                            }    
                        %>
                    </select>
                </div>

                <div>
                    <label>
                        <input type="checkbox" name='curso' value='sim' />
                        <span>Está interessado em cursos de atualização?</span>
                    </label>                
                </div>
                <button>Enviar</button>
            </form>
        </section>
        <section>
        <% 
            String nome = request.getParameter("nome");
            String bairro = request.getParameter("bairro");
            String semestre = request.getParameter("semestre");
            String curso = request.getParameter("curso");
            
            
            if(nome!=null && bairro!=null && semestre!=null){
                out.println(infoGerais(nome,bairro,semestre));
                out.println("<h3>Ônibus que passam em "+ tituloBairro(bairro) + ":</h3>" +
                infoBairro(bairro));
                out.println("<h3>"+ tituloSemestre(semestre)+ "</h3>" + infoSemestre(semestre));
                
                if(curso!=null){
                    out.println(infoCurso());
                }
                
            }
        %>
        </section>
        
        <%! 
            public String infoGerais(String nome,String bairro, String semestre){
                String conteudo = 
                "<div>" + 
                "<h3> Nome do Aluno: <span>" + nome + "</span></h3>" +
                "<h3> Lugar onde Mora: <span>" + tituloBairro(bairro) + "</span></h3>" +
                "<h3> Matriculado no: <span>" + semestre + "º Semestre</span></h3>" + 
                "</div>";

                return conteudo;
            }
            
            public String tituloBairro(String valor){
                String bairro = "";
                if("af".equals(valor)){
                    bairro = "Anália Franco";
                }else{
                    bairro = "São Miguel Paulista";;;;
                }
                
                return bairro;
            }

            public String tituloSemestre(String semestre){
                String titulo = "";
                
                if("1".equals(semestre) || "2".equals(semestre)){
                    titulo= "Como funciona a Biblioteca e o Lab";
                }else if("8".equals(semestre)){
                    titulo = "Pos-Graduação";
                }else{
                    titulo = "Horas Complementares";
                }
                return titulo;  
            }

            public String gerarHtml(ArrayList<String> array){
                String conteudo = "";
                  
                for(String i:array){
                    conteudo+="<li>" + i + "</li>";
                }

                return conteudo+="</ul>";
            }
            
            public String infoBairro(String bairro){
                ArrayList<String> linhas = new ArrayList<String>();
                String conteudo="<ul>";
                if("af".equals(bairro)){
                   linhas.add("2100/10 Terminal Vila Carrão");
                   linhas.add("372U/10 Vila Santa Isabel ");
                   linhas.add("407R-10 Terminal Vila Carrão");
                   linhas.add("2100/10 Terminal Vila Carrão");

                   conteudo+=gerarHtml(linhas);
                }else{
                    linhas.add("3001 Itaim Paulista");
                    linhas.add("2031 Terminal A.E. Carvalho");
                    linhas.add("2076 Jardim das Oliveiras");
                    linhas.add("2080 Terminal Aricanduva");

                    conteudo+=gerarHtml(linhas);
                }
                return conteudo;
            }
            public String infoSemestre(String semestre){
                ArrayList<String> infos = new ArrayList<String>();
                String conteudo = "<ul>";

                if("1".equals(semestre) || "2".equals(semestre)){
                    infos.add("A biblioteca funciona das 10:00 às 22:00");
                    infos.add("O Lab. de informática é de uso livre até às 19:20 ");
                    
                    conteudo+=gerarHtml(infos);
                }else if("8".equals(semestre)){
                    infos.add("Informática na Educação");
                    infos.add("Engenharia de Websites");
                    infos.add("Master Business in Information Systems");
                    
                    conteudo+=gerarHtml(infos);
                }else{
                    infos.add("Não se esqueça de fazer suas horas complementares");
                    infos.add("Você deve ter mais de 220 horas");
                    infos.add("<a>Para mais informações, clique aqui</a>");

                    conteudo+=gerarHtml(infos);
                }
                return conteudo;
            }
            public String infoCurso(){
                ArrayList<String> cursos = new ArrayList<String>();
                String conteudo = "<h3>Cursos Disponíveis</h3><ul>";

                cursos.add("C#.NET");
                cursos.add("processamento de BDs");
                cursos.add("Desenvolvimento Flutter");
                cursos.add("Curso React e Vue");
                cursos.add("Spring Web MVC");

                conteudo+=gerarHtml(cursos);

                return conteudo;
            }
        %>
    </body>
</html>
