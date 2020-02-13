<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");

MemberDTO memberDTO = new MemberDTO();
MemberDAO memberDAO = MemberDAO.getDAO();

//DTO에 파라미터값 삽입
memberDTO.setId(request.getParameter("id"));	//아이디 
memberDTO.setPassword(request.getParameter("pass1"));	//패스워드
memberDTO.setName(request.getParameter("name"));	//이름
memberDTO.setAddress(request.getParameter("address"));	//주소
memberDTO.setSex(request.getParameter("sex"));	//성별
memberDTO.setBirthday(request.getParameter("birthday")); //생일
memberDTO.setPhone(request.getParameter("phone"));	//전화번호

memberDAO.insertMember(memberDTO);
System.out.println("5");
out.print("true");
%>