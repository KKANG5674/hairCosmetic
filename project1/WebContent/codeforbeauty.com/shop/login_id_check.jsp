
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원가입 입력페이지(member_join.jsp)에서 전달된 아이디의 사용 가능 유무를 검사하여 응답하는 JSP 문서 --%>
<%-- => 전달된 아이디가 MEMBER 테이블에 저장된 경우 : 사용 불가능 메세지 응답 - 아이디를 다시 입력받아 검사 --%>    
<%-- => 전달된 아이디가 MEMBER 테이블에 저장되지 않은 경우 : 사용 가능 메세지 응답 - 부모창의 입력태그의 아이디 전달 --%>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("id")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//전달된 아이디를 반환받아 저장
	String id=request.getParameter("id");

	//아이디를 전달하여 회원정보를 반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 전달된 아이디 사용 가능
	// => MemberDTO 인스턴스 반환 : 회원정보 검색 - 전달된 아이디 사용 불가능
	MemberDTO member=MemberDAO.getDAO().getMember(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id { color: red; }
</style>
</head>
<body>
	<% if(member==null) {//아이디 사용 가능 %>
	<div>입력한 <span class="id">[<%=id%>]</span>는 사용 가능한 아이디입니다.<br>&nbsp;</div>
	<div><button type="button" onclick="windowClose();">아이디 사용</button></div>	
	<% } else {//아이디 사용 불가능 %>
	<div id="message">입력한 <span class="id">[<%=id%>]</span>는 이미 사용중인 아이디입니다.<br>
	다른 아이디를 입력하고 [확인]을 눌러 주세요.</div>
	<div>
	<%-- action 속성이 생략된 경우 현재 문서에 입력값 전달 --%>
	<%-- method 속성이 생략된 경우 GET 방식 요청 --%>
	<%-- onsubmit 속성 : 전달 이벤트가 발생될 경우 호출될 이벤트 핸들러 등록 --%>
	<%-- => 속성값 : return {false|true} - false(미전달), true(전달) --%>
	<%-- => 이벤트 핸들러 함수는 반드시 false 또는 true 반환 --%>	
	<form name="form" onsubmit="return submitCheck();">
		<input type="text" name="id">
		<button type="submit">확인</button>	
	</form>	
	</div>	
	<% } %>
	
	<script type="text/javascript">
	function windowClose() {
		//opener 객체 : 현재창에 실행한 부모창을 표현하는 객체
		opener.joinData.id.value="<%=id%>";
		opener.joinData.idCheckResult.value="1";
		window.close();//창닫기
	}	
	
	function submitCheck() {
		var id=form.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="이메일을 입력해 주세요.<br>&nbsp;";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
		if(!emailReg.test(id)) {
			document.getElementById("message").innerHTML="입력한 이메일이 형식에 맞지 않습니다.";
			document.getElementById("message").style="color:red;";
			return false;
		}
		
		return true;
	}
	</script>	
</body>
</html>