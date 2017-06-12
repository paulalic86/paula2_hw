<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029027" />
  <jsp:setProperty property="user" name="database" value="4104029027" />
  <jsp:setProperty property="password" name="database" value="Ss4104029027!" />

</jsp:useBean>
<jsp:useBean id="person" scope="session" class="com.database.Person"/>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 // 取得註冊欄位資料
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 int x = 0;int y = 0;
 String message="";
 // 判斷欄位資料是否有值
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     // 連線資料庫
     database.connectDB();
     // 執行資料庫SQL（Select）
     String sql = "select * from person;";
     database.query(sql);
     // 將 person Table數值存入到rs集合中
     rs = database.getRS();

     if(rs!=null){
         while(rs.next()){
           String accountData = rs.getString("account");
           // 判斷是否有存在這個帳號
           if(account.equals(accountData)){
             y+=1;
             break;
           }
         }

         // 如果 y 不等於 0 , 則代表有這個帳號 , 註冊失敗
         if(y!=0){
           message="註冊失敗!";
           try{
             database.connectDB();
             String sqldata = "select * from person where account = '" + account + "'" ;

             database.query(sqldata);
             rs = database.getRS();
            //  out.println(sql + "<br/>");
             while(rs.next()){
                //取得會員資料
                account = request.getParameter("account");
                password = request.getParameter("password");
                name = request.getParameter("name");
                birth = request.getParameter("birth");
                email = request.getParameter("email");
                phone = request.getParameter("phone");

                person.setName(name);
                person.setBirth(birth);
                person.setEmail(email);
                person.setPhone(phone);

                response.sendRedirect("setData.jsp");

                // window.open('setData.jsp','_self');
             }
           }catch(Exception ex){
             out.println(ex);
           }

         }else{
           // 如果 y 等於 0 , 代表資料庫可進行註冊 (execute SQL insert )
           database.insertData(account,password,name,birth,email,phone);
           message="註冊成功!";
           // 你註冊完之後 , 這邊的 x y 都還是保持0 , 所以這邊的邏輯錯了

           try{
             database.connectDB();
             String sqldata = "select * from person where account = '" + account + "'" ;

             database.query(sqldata);
             rs = database.getRS();
            //  out.println(sql + "<br/>");
             while(rs.next()){
                //取得會員資料
                account = request.getParameter("account");
                password = request.getParameter("password");
                name = request.getParameter("name");
                birth = request.getParameter("birth");
                email = request.getParameter("email");
                phone = request.getParameter("phone");

                person.setName(name);
                person.setBirth(birth);
                person.setEmail(email);
                person.setPhone(phone);

                response.sendRedirect("setData.jsp");

                // window.open('setData.jsp','_self');
             }
           }catch(Exception ex){
             out.println(ex);
           }
         }
      }
     }catch(Exception ex){
       out.println(ex);
     }
   }else{
     // 此部分主要是判斷是否從login頁面來的

      session.setAttribute("login", "ok");
      session.setAttribute("account", account);
      session.setAttribute("password", password);
      out.println("登入成功!");

    }

  //      try{
  //        database.connectDB();
  //        String sql = "select * from person where account = '" + account + "'" ;
  //        database.query(sql);
  //        rs = database.getRS();
  //       //  out.println(sql + "<br/>");
  //        while(rs.next()){
  //           //取得會員資料
  //           account = request.getParameter("account");
  //           password = request.getParameter("password");
  //           name = request.getParameter("name");
  //           birth = request.getParameter("birth");
  //           email = request.getParameter("email");
  //           phone = request.getParameter("phone");
  //        }
  //      }catch(Exception ex){
  //        out.println(ex);
  //      }
  //  }
   //

%>
<%-- <!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Member</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="mystyle.css">
  </head>
  <body>
    <div class="container">

      <%-- <section id="content">
            <form>
            <%
              String account = request.getParameter("account");
              if(account != ""){
              String sql = "select * from person where account ='" + account + "'";
              pstmt = con.prepareStatement(sql);
              ResultSet rs = pstmt.executeQuery();
              if(rs.next()){
                out.println("此帳號已被註冊");
              } else {
                window.open('setData.jsp','_self');
              }
            %>

              <input type="button" onclick="window.open('new.jsp','_self')" value="點此註冊"/>
          </form>
      </section> --%>
    <%-- </div>
  </body>
</html> --%>
