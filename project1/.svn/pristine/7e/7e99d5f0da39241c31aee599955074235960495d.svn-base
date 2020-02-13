<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST 방식의 입력값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("UTF-8");
	
	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=request.getParameter("pass1");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String sex=request.getParameter("sex");
	String birthday=request.getParameter("birthday");
	String phone=request.getParameter("phone");
	
	
	//DTO 인스턴스를 생성하고 입력값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPassword(passwd);
	member.setName(name);
	member.setAddress(address);
	member.setSex(sex);
	member.setBirthday(birthday);
	member.setPhone(phone);
	
	/*
	System.out.println("id = "+id);
	System.out.println("passwd = "+passwd);
	System.out.println("name = "+name);
	System.out.println("address = "+address);
	System.out.println("sex = "+sex);
	System.out.println("birthday = "+birthday);
	System.out.println("phone = "+phone);
	*/
	
	//회원정보를 전달하여 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().modifyMember(member);
	
	//변경된 회원정보를 이용하여 세션에 인증정보(회원정보) 재공유
	session.setAttribute("loginMember", MemberDAO.getDAO().getMember(id));	
	
	//회원정보 상세 출력페이지 이동
	response.sendRedirect(request.getContextPath()+"/codeforbeauty.com/shop/member_detail.jsp");
%>
	<%--
	<script>
		location.href='<%=request.getContextPath()%>/codeforbeauty.com/shop/member_detail.jsp';
	</script>
	--%>