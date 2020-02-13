<%@page import="member.MemberDTO"%>
<%@page import="oracle.net.aso.q"%>
<%@page import="question.QuestionDTO"%>
<%@page import="question.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//비정상 요청 응답 처리
	if(request.getMethod().equals("GET")){
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	//POST 방식으로 요청되어 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");
	
	//입력값 반환받아 저장
	String pageNum=request.getParameter("pageNum");
	
	//XSS 처리
	String title=request.getParameter("title");
	String content = request.getParameter("content");
/* 	
	//입력값 없을 경우 처리
	if(title==null||title.equals("")||content==null||content.equals("")){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	 */
	//SEQ 자동 증가값
	int num = QuestionDAO.getDAO().getBoardNum();
	
	//세션으로 공유된 인증정보(회원정보)를 반환받아 저장
	MemberDTO loginMember= new MemberDTO();
	loginMember.setId(session.getAttribute("sessionID").toString());
 	
 	/* String id ="tester"; */
 
	//DTO 인스턴스 생성 후 필드값 변경
	QuestionDTO question= new QuestionDTO();
	question.setNum(num);
	question.setTitle(title);
	question.setContent(content);
	question.setId(loginMember.getId()); 
	

	/* question.setId(id); */
	
	
	//DAO 메소드 호출 - 삽입
	QuestionDAO.getDAO().insertQuestion(question);
	
	//목록 페이지 이동
	response.sendRedirect(request.getContextPath() + "/codeforbeauty.com/shop/faq.jsp?work=faq_question&pageNum="+pageNum);
	

%>