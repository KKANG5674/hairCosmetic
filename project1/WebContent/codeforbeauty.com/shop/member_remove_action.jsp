<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%
	String id = session.getAttribute("sessionID").toString();

	//아이디를 전달하여 MEMBER 테이블에 저장된 회원정보를 삭제하는 DAO 클래스의 메소드 호출
	MemberDTO member = new MemberDTO();
	member.setId(id);
	MemberDAO.getDAO().removeMember(id);	
	
	// remove_actionPro 페이지로 이동
	response.sendRedirect(request.getContextPath()+"/codeforbeauty.com/shop/member_remove_actionPro.jsp");
%>
    