<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");

MemberDAO memberDAO = MemberDAO.getDAO();
MemberDTO memberDTO = new MemberDTO();

memberDTO.setId(request.getParameter("loss_email"));
memberDTO.setBirthday(request.getParameter("loss_birthday"));
memberDTO.setName(request.getParameter("loss_name"));

int check = memberDAO.passSearchCheck(memberDTO);
if(check == 1)    // 입력한 정보가 맞을경우
{ 
  out.println("<script>location.href='../passview.jsp?loss_email="+request.getParameter("loss_email")+"';</script>");
}else{	//입력정보가 다를경우
	
    out.println("<script>alert('입력하신 정보가 맞지않습니다.');</script>");
	out.println("<script>location.href='../passSearch.jsp';</script>");
}



%>