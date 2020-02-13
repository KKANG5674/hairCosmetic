<%@page import="question.QuestionDTO"%>
<%@page import="question.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//비정상적인 요청에 대한 응답처리 => 전달값이 존재하지 않을 경우
	if(request.getParameter("num")==null){
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin';");
		out.println("</script>");
		return;
	} 

	//POST 방식으로 요청되어 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");
	
	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//게시글 검색
	QuestionDTO question=QuestionDAO.getDAO().getBoard(num);
	
	//비정상적인 요청에 대한 응답 처리
	// => 검색된 게시글이 없는 경우
		if(question==null) {
			out.println("<script>");
			out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin';");
			out.println("</script>");
			return;
		} 
	
	//게시글 삭제
	QuestionDAO.getDAO().deleteQuestion(num);
	
	//페이지이동
	response.sendRedirect(request.getContextPath()+"/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum="+pageNum+"&search="+search+"&keyword="+keyword); 
%>
