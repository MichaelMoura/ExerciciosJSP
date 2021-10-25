<%@ page import="java.sql.*"%>
<%
Connection con=null;
PreparedStatement pstm=null;
try {    
    String serverName = "localhost:3306"; 
    String mydatabase = "lojacds";  
    String username = "root";
    String password = "12345";    
    String driverName = "com.mysql.jdbc.Driver";
    Class.forName(driverName);   
    String url = "jdbc:mysql://" + serverName + "/" + mydatabase; 
    con = DriverManager.getConnection(url, username, password);      
}
catch(SQLException ex) {
    out.print(ex.getMessage());
}
%>
