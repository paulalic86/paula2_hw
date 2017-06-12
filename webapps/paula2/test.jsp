<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
  Connection con =null;
//the statement after checking
  Statement stmt = null;
//the information after checking
  ResultSet rs = null;
  String ip = "140.120.49.205";
  String port = "3306";
  String url = "";
  String db = "4104029027";
  String user = "4104029027";
  String password = "Ss4104029027!";
  String driver = "com.mysql.jdbc.Driver";
  url = "jdbc:mysql://" + ip + ":" + port +"/" +db + "?useUnicode=true&characterEncoding=utf-8";
  Class.forName(driver);
  con = DriverManager.getConnection(url, user, password);
  stmt = con.createStatement();
  String sql = "select * from person;";
  rs = stmt.executeQuery(sql);
  out.println(rs);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

  </body>
</html>
