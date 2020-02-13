<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum="1"; //요청 페이지 번호
	
%>
<style>
#question_input {
    text-align: center;
    width: 100%;
    line-height: 1.5;
    background-color: #fafafa;
}
#question_input th {
    height: 30px;
    vertical-align: top;
    background-color: #e7d0f5;
}
#question_input th, #question_input td {
    padding: 9px 9px 7px;
    border: 1px solid #dec0f0;
    text-align: center;
}

/* 버튼 */
button[type="submit"],button[type="reset"] {
   text-align: center;
    border: 1px solid #e7d0f5;
    background: #e7d0f5;
    color: #3e4149;
}

#cancel {
   text-align: center;
    border: 1px solid #e7d0f5;
    background: #e7d0f5;
    color: #3e4149;
}


</style>
<div id="content">
	<div id="header">
		<%-- <h2><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/write.png" style="height: 22px;">문의하기</h2> --%>
	</div>
	<div>
		<%-- <form action="<%=request.getContextPath()%>/codeforbeauty.com/shop/faq_question_write_action.jsp" method="POST" id="questionForm"> --%>
		
		<form id="questionForm">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<table id="question_input">
			<colgroup>
				<col width="140px" />
				</col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" style="text-align: center;">제목</th>
					<td><input type="text" name="title" id="title" style="width: 95%;" placeholder="제목을 입력해주세요."  %></td>
				</tr>
				<tr>
					<th scope="row" style="text-align: center; padding-top: 35px;">내용</th>
					<td>
						<textarea name="content" id="content2" cols="60" rows="5" placeholder="무엇이든 물어보세요."
                              style="margin: 0px; width: 95%; resize: vertical; "></textarea>
                    </td>    
				</tr>
				<br>
				
			</tbody>
		</table>
			<br>
			<div id="message" style="color: red;"></div>
			<br>
			<div>
						<button type="button" id="saveBtn" style="height: 30px;">등록</button>&nbsp;&nbsp;
						<button type="reset" id="resetBtn" style="height: 30px;">다시입력</button>&nbsp;&nbsp;
						<button type="button" id="listBtn" style="height: 30px;">목록</button>
			</div>
		
		</form>
	</div>
</div>

<script type="text/javascript">
$("#title").focus();

$("#listBtn").click(function() {
	location.href="<%=request.getContextPath()%>/codeforbeauty.com/shop/faq.jsp?work=faq_question";
}); 


/*  $("#questionForm").submit(function() { */

$("#saveBtn").click(function() {
	
	if($("#title").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#title").focus();
		return;
	}
	
	if($("#content2").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#content2").focus();
		return;
	}
	
	$("#questionForm").attr("method","post");
	$("#questionForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/faq_question_write_action.jsp");
	$("#questionForm").submit();
});
 


</script>
