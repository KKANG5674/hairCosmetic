<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");

MemberDAO memberDAO = MemberDAO.getDAO();

String id=request.getParameter("loss_email");
String passwd=request.getParameter("loss_passwd");
memberDAO.passwordUpdate(id, passwd);



	out.println("<script>location.href='../loginPage.jsp';</script>");
%>