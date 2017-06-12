<%
session.removeAttribute("login");
// out.println("logout");

  response.sendRedirect("./index.jsp");
%>
