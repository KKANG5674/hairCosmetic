<%@page import="javafx.scene.control.Alert"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");
MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(request.getParameter("login_id1"));
memberDTO.setPassword(request.getParameter("login_pass1"));

    // DB에서 아이디, 비밀번호 확인
    MemberDAO memberDAO = MemberDAO.getDAO();
    int check = memberDAO.loginCheck(memberDTO);
    // URL 및 로그인관련 전달 메시지
 	//String msg = "";
    
      if(check == 1)    // 로그인 성공
    { 
    	  // 세션에 현재 아이디 세팅
      session.setAttribute("sessionID", memberDTO.getId());
      session.setAttribute("sessionPASSWD", memberDTO.getPassword());
     
      int rows = MemberDAO.getDAO().modifyLoginMemberDate(memberDTO.getId());
      out.println("<script>alert('로그인에 성공하였습니다.');</script>");
  	  out.println("<script>location.href='../index2.jsp';</script>");
    }
     else if(check == 0) // 비밀번호가 틀릴경우
    {
		out.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다. 다시 입력해주세요.');</script>");
	  	out.println("<script>location.href='../loginPage.jsp';</script>");
    } 
    else    // 아이디가 틀릴경우
    {
      //  msg = "./loginForm.jsp?msg=-1";
      	out.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다. 다시 입력해주세요.');</script>");
    	out.println("<script>location.href='../loginPage.jsp';</script>");
    } 
     
     //sendRedirect(String URL) : 해당 URL로 이동
    // URL뒤에 get방식 처럼 데이터를 전달가능
    //response.sendRedirect(msg); 

%>