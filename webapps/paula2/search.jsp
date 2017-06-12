<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029027" />
  <jsp:setProperty property="user" name="database" value="4104029027" />
  <jsp:setProperty property="password" name="database" value="Ss4104029027!" />
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 int x = 0;int y = 0;
 String message="";
 try{
   database.connectDB();
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>

<html>
<head>
  <meta charset="utf-8">
  <title>Search</title>
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
  <link rel="stylesheet" href="mystyle.css">
</head>
<body>
  <table id="people">
    <tr>
    <th>Account</th>
    <th>Password</th>
    <th>Name</th>
    <th>Birthday</th>
    <th>Email</th>
    <th>PhoneNUM</th>
    </tr>
      <%
      // String num ="SELECT COUNT(*) FROM person";
      // int n = Integer.parseInt(num);
      if(rs!=null && y==0){
        while(rs.next()){
        String name1=rs.getString("name");
        String birth1=rs.getString("birth");
        String email1=rs.getString("email");
        String phone1=rs.getString("phone");
        String account1=rs.getString("account");
        String pass1=rs.getString("password");
      %>

      <tr>
      <td><%=account1%></td>
      <td><%=pass1%></td>
      <td><%=name1%></td>
      <td><%=birth1%></td>
      <td><%=email1%></td>
      <td><%=phone1%></td>
      </tr>
      <br>

      <%
          }
        }
      %>
  </table>
  <input type="button" id="login" onclick="window.open('index.jsp','_self')" value="返回登入畫面"/>
</body>
</html>
