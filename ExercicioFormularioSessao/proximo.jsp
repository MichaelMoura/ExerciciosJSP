<%-- 
    Document   : proximo
    Created on : 02/10/2021, 18:24:41
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% 
        try{
            
        
        String name,email,gender;
        name = request.getParameter("name");
        email = request.getParameter("email");
        gender = request.getParameter("gender");

        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("gender", gender);
        }catch(Exception error){
            out.println(error);
            out.println("<h1>Não foi possível salvar os dados</h1>");
        }
    %>
    <body>
        <form method="post" action="final.jsp">
            <div>
                <label>
                    <input type="checkbox" name="category" value="horror" /> 
                    <span>Horror</span>
                </label>
                <label>
                    <input type="checkbox" name="category" value="aventure" /> 
                    <span>Aventure</span>
                </label>
                <label>
                    <input type="checkbox" name="category" value="drama" /> 
                    <span>Drama</span>
                </label>
            <div>
                
            <div>
                <select name="profession">
                    <option>doctor</option>
                    <option>lawer<option>
                    <option>nurse</option>
                    <option>engineer</option>
                </select>
            </div>
            <div>    
                <textarea name="observation"></textarea>
            </div>
            <button>salvar</button>
        </form>
    </body>
</html>
