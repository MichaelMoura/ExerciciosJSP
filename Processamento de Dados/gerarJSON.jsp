<%@page contentType="json" pageEncoding="UTF-8"%>
<%@include file="conecta.jsp" %>

{
    "cds":[
         <%
            ResultSet rs = null;
            String sql = "";  
            try{
                sql = "SELECT * FROM cds";
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();                
                while(rs.next()) {            
                    %>
                     {
                        "codigo":<%= rs.getInt("codigo")%>, 
                        "titulo":"<%= rs.getString("titulo")%>", 
                        "interprete":<%= rs.getString("interprete")%>, 
                        "genero":<%= rs.getString("genero")%>, 
                        "preco":"<%= rs.getFloat("preco")%>"} 
                        <% if(!rs.isLast()){ %>,<% }                                     
                } 
        } catch(Exception ex){
            out.print(ex.getMessage());
        }
        finally {
            if(rs!=null) rs.close();
            if(pstm!=null) pstm.close();
        }
        %>
    ]
}
