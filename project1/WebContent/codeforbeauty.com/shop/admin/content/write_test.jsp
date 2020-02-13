<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=200;i++) {
	    NoticeDTO notice = new NoticeDTO();
		int num=NoticeDAO.getDAO().getNoticeNum();
		notice.setNum(num);
		notice.setTitle("공지사항"+i);
		notice.setContent("공지사항입니다."+i);
		notice.setId("관리자1");
		NoticeDAO.getDAO().addNotice(notice);
	}
%>
<h1>200개의 테스트 게시글 저장 하였습니다.</h1>