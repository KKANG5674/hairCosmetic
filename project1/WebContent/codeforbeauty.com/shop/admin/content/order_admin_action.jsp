<%@page import="semiProject.OrderDTO"%>
<%@page import="semiProject.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");

OrderDAO orderDAO = OrderDAO.getDAO();

String count = request.getParameter("count");
String count2=count.substring(9);

String payment = request.getParameterValues("search"+count2)[0];
String delivery = request.getParameterValues("search2"+count2)[0];
int no = Integer.parseInt(request.getParameter("orderNumber"+count2));

orderDAO.updateOrder(no, payment, delivery);
 


	out.println("<script>location.href='../index_admin.jsp?workgroup=content&work=order_admin';</script>");
%>