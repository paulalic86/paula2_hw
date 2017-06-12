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
 try{
   database.connectDB();
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <script language="JavaScript">
              $(document).ready(function(){

                $("input").blur(function(){
                    if ($(this).val().length == 0) {
                        $(this).addClass('error').after('<span class="error"><br>請填寫此欄位!</span>');
                    }
                    var accountVal = $('#account').val();
                    console.log(accountVal);
                    $.post("query.jsp", { account : accountVal } ,
                    function(data){
                      $("#result").html(data);
                    }
                  )
                });
                $("input").focus(function(){
                    $(this).removeClass('error').next('span').remove();
                });
              });
          </script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>註冊</title>
    <link rel="stylesheet" href="mystyle.css">
  </head>
  <body>
    <div class="container">
      <section id="content">
        <h1>註冊</h1>
        <form action="member.jsp" method="post">
          <input id="account" name="account" type="text" placeholder="帳號" autocomplete="off" autofocus required/><div id="result"></div>
          <br>
          <input name="password" id="password" type="password" placeholder="密碼"/>
          <br>
          <input name="name" id="name" type="text" placeholder="姓名" autocomplete="off"/>
          <br>
          <input name="birth" id="birth" type="text" placeholder="生日" autocomplete="off"/>
          <br>
          <input name="email" id="email" type="text" placeholder="電子郵件" autocomplete="off"/>
          <br>
          <input name="phone" id="phone" type="text" placeholder="電話號碼" autocomplete="off"/>
          <br>
          <div style="text-align:center !important">
            <input type="submit" id="regis" value="提交"/>
          </div>
        </form>
      </section>
    </div>
  </body>
</html>
