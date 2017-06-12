<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp"%>
<%
  request.setCharacterEncoding("UTF-8");
  String account = request.getParameter("account");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String birth = request.getParameter("birth");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");

  if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
    
  }
%>
