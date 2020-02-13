<%@page import="cart.CartDTO"%>
<%@page import="cart.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");
//DAO DTO 객체 생성
CartDAO cartDAO = CartDAO.getDAO();
CartDTO cartDTO = new CartDTO();

cartDTO.setId(session.getAttribute("sessionID").toString());
String a = request.getParameter("orderNo");
int no = Integer.parseInt(a);
cartDAO.deleteCart(no);


out.println("<script>location.href='../cart_ok.jsp';</script>");
%>