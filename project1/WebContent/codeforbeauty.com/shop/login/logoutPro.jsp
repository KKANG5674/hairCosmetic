<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<script type="text/javascript" src="./js/jquery-3.2.1.min.js" charset="UTF-8">	</script>
<%
	out.println("<script> alert('로그아웃 되었습니다.');</script>");
	session.invalidate();
	out.println("<script>location.href='../index2.jsp';</script>");
%>