<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionDTO"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=200;i++) {
	    QuestionDTO question = new QuestionDTO();
		int num=QuestionDAO.getDAO().getBoardNum();
		question.setNum(num);
		question.setTitle("문의하기-"+i);
		question.setContent("문의하기 테스트입니다.-"+i);
		question.setId("test");
		QuestionDAO.getDAO().insertQuestion(question);
		
	}
%>
<h1>200개의 테스트 게시글 저장 하였습니다.</h1>