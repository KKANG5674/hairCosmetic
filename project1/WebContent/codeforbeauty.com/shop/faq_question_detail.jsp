<%@page import="reply.ReplyDAO"%>
<%@page import="reply.ReplyDTO"%>
<%@page import="oracle.net.aso.q"%>
<%@page import="member.MemberDTO"%>
<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비정상적인 요청에 대한 응답처리 => 전달값이 존재하지 않을 경우
	if(request.getParameter("num")==null){
		out.println("<script>");
		out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/faq.jsp?work=faq_question';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//게시글 번호를 전달하여 questiontable 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	//게시글 검색 반환
	QuestionDTO question=QuestionDAO.getDAO().getBoard(num);
	
	//등록데이터 불러오기
	ReplyDTO reply= ReplyDAO.getDAO().getReplyNo(num);
	
	//비정상적인 요청에 대한 응답 처리
	// => 검색된 게시글이 없는 경우
		if(question==null) {
			out.println("<script>");
			out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/faq.jsp?work=faq_question';");
			out.println("</script>");
			return;
		}

		int parents = (Integer)ReplyDAO.getDAO().getParents(num);
	/* //조회수 증가
	QuestionDAO.getDAO().modifyReadCount(num); 
	*/

%>
<style>
/*문의하기 디테일*/    
#question_detail {
    line-height: 1.5;
    background-color: #fafafa;
}

#question_detail th {
    width: 150px;
    height: 30px;
    vertical-align: top;
    background-color: #e7d0f5;
}
#question_detail th, #question_detail td {
    padding: 9px 9px 7px;
    border: 1px solid #dab6f0;
    text-align: left;
}
button[type="button"] {
    height: 30px;
    text-align: center;
    border: 1px solid #e7d0f5;
    background: #e7d0f5;
    color: #3e4149;
    
}

/*문의하기-답글*/
#reply_detail {
    line-height: 1.5;
    background-color: #fafafa;
}
#reply_detail th {
    width: 150px;
    height: 30px;
    vertical-align: top;
    background-color: #e7d0f5;
}
#reply_detail th, #reply_detail td {
    padding: 9px 9px 7px;
    border: 1px solid #dab6f0;
    text-align: left;
}

<style>
.question_detail th, .question_detail td{
	word-break:break-all;
}
</style>

</style>
<div id="content">
            <div style="width: 960px;">
            <table id="question_detail">
            	
            	<tr>
            		<th style="text-align: center;">작성자</th>
            		<td>
            			<%=question.getId() %>
            		</td>
            	</tr>
            	
            	<tr>
            		<th style="text-align: center;" >작성일</th>
            		<td><%=question.getDateCreated().substring(0, 19) %></td>
            	</tr>
            	
            	<tr>
            		<th style="text-align: center;">제목</th>
            		<td class="title">
            			<%=question.getTitle() %>
            		</td>
            	</tr>
            	
            	<tr>
            		<th style="text-align: center; padding-top: 35px;" >내용</th>
            		<td class="content" style=" height: 300px; vertical-align: text-top;">
            			<%=question.getContent().replace("\n", "<br>") %>
            		</td>
            	</tr>
            </table>
         
     
     <br>
     <br>
     <%if(parents == num){ %>
     <div id="reply">
     	<table id="reply_detail">
     		
     		<tr>
     			<th style="text-align: center;">작성자</th>
     			<td><%=reply.getId() %></td>
     		</tr>
     		
     		<tr>
            	<th style="text-align: center;" >작성일</th>
            	<td><%=reply.getDateCreated().substring(0, 19)%></td>
            </tr>
            	
            <tr>
            	<th style="text-align: center;">제목</th>
            	<td><%=question.getId() %>님께서 남기신 문의사항의 답변입니다.</td>
            </tr>
     		
     		<tr>
     			<th style="text-align: center; height: 250px; padding-top: 35px;">답변내용</th>
     			<td><%=reply.getContent().replace("\n", "<br>") %></td>
     		</tr>
     		
     	</table>
     		  <br> 
     </div> 
     <%} %>
      	<div style="margin-left: 20px; text-align: center;">
      		<button type="button" id="removeBtn">삭제</button>&nbsp;&nbsp;
			<button type="button" id="listBtn">목록</button>&nbsp;&nbsp;
      	</div>  
     </div> 
     
     
     
     
      
</div>  
  
<form id="questionForm" method="post">
    <input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
</form> 

<script type="text/javascript">

$("#removeBtn").click(function() {
	
	<%if(session.getAttribute("sessionID")==null){ /* 로그인 안한경우 */ %>
		
		alert("로그인이 필요합니다.");
		location.href="<%=request.getContextPath()%>/codeforbeauty.com/shop/loginPage.jsp";
	
	<%}else if(!(session.getAttribute("sessionID").equals(question.getId()))){ /* 로그인했지만 작성자가 아닌 경우 */  %>
		
		alert("관리자 또는 작성자만 삭제가 가능합니다.");
		location.href="<%=request.getContextPath()%>/codeforbeauty.com/shop/faq.jsp?work=faq_question";
	
	<% }else if(session.getAttribute("sessionID").equals(question.getId())){/*로그인한 작성자인 경우*/ %>
	
	if(confirm("정말로 삭제 하시겠습니까?")) {
		$("#questionForm").attr("action", "<%=request.getContextPath()%>/codeforbeauty.com/shop/faq_question_remove_action.jsp");
		$("#questionForm").submit();
	}
	
	<%}%>

	});


<%-- $("#replyBtn").click(function() {
	$("#boardForm").attr("action", "<%=request.getContextPath()%>/site/index.jsp?workgroup=board&work=board_write&ref=<%=board.getRef()%>&reStep=<%=board.getReStep()%>&reLevel=<%=board.getReLevel()%>");
	$("#boardForm").submit();
}); --%>

$("#listBtn").click(function() {
	$("#questionForm").attr("action", "<%=request.getContextPath()%>/codeforbeauty.com/shop/faq.jsp?work=faq_question");
	$("#questionForm").submit();
});



</script> 

