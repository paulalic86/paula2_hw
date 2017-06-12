<%@ page contentType="text/html; charset=utf8" %>


<jsp:useBean id="person" scope="session" class="com.database.Person"/>
<%-- <jsp:setProperty name="person" property="userName"/>
<jsp:setProperty name="person" property="Birth"/>
<jsp:setProperty name="person" property="Email"/>
<jsp:setProperty name="person" property="Phone"/> --%>
<html>
<head>
  <link rel="stylesheet" href="mystyle.css">
</head>
<body>
  <form>
  <center>
  <h1>註冊資料</h1>
  <br>
  <h2>
  姓名：<%= person.getUserName()%>
  <br>
  生日：<%= person.getBirth()%>
  <br>
  信箱：<%= person.getUserEmail()%>
  <br>
  電話：<%= person.getUserPhone()%>
  <br>
  </h2>
<input type="button" id="login" onclick="window.open('index.jsp','_self')" value="返回登入畫面"/>
<input type="button" onclick="window.open('logout.jsp','_self')" value="登出"/>

</center>

</body>
</html>
