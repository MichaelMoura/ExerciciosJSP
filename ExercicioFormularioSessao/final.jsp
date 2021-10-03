<%-- 
    Document   : final
    Created on : 02/10/2021, 19:58:08
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        td,th{
            padding: 0 5px;
        }
        
        table,td,th,tr{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
    </style>
    <%!
        String profession, observation;
        String[] category;
        public String generateTD(String value){
            String tag = "<td>" + value + "</td>";
            return tag;
        }
    %>
    
    <% 
        try{
            profession = request.getParameter("profession");
            observation = request.getParameter("observation");
            category = request.getParameterValues("category");
            
            session.setAttribute("profession", profession);
            session.setAttribute("observation", observation);
            
            for(int i=0;i<category.length;i++){
                session.setAttribute("category"+i, category[i]);
            }
        }catch(Exception error){
            out.println(error);
            out.println("<h1>Não foi possível salvar os dados</h1>");
        }
    %>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <%
                        if(category.length == 0){
                            out.println("<th>Category</th>");
                        }
                        for(int i=0;i<category.length;i++){
                            out.println("<th>Category</th>");
                        }
                    %>
                    <th>Profession</th>
                    <th>Observation</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        try{
                            out.println(generateTD((String)session.getAttribute("name")));
                            out.println(generateTD((String)session.getAttribute("email")));
                            out.println(generateTD((String)session.getAttribute("gender")));

                            for(int i=0;i<category.length;i++){
                                out.print(generateTD((String)session.getAttribute("category"+i)));
                            }

                            out.println(generateTD((String)session.getAttribute("profession")));
                            out.println(generateTD((String)session.getAttribute("observation")));
                        }catch(Exception error){
                            out.println(error);
                            out.println("<h1>Não foi possível apresentar os dados na tela</h1>");
                        }
                        
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
