<%-- 
    Document   : index
    Created on : 02/10/2021, 17:32:38
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="proximo.jsp">
            <div>
                <span>Nome</span><input type="text" name='name'/>
            </div>
            <div>
                <span>Email</span><input type="text" name='email' />
            </div>
            <div>
                <select name='gender'>
                    <option></option>
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>
            <button action="proximo.jsp" >Enviar</button>
        </form>
    </body>
</html>
