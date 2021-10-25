<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <h1>Loja de CDs</h1>
        <div id="resultado"></div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
    <script>
        $(document).ready(() => {
                $.getJSON('gerarJSON.jsp', (data) => {
                    console.log(data);
                });
            });               
    </script>
</html>
