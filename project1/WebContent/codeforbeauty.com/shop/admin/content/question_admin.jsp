<%@page import="reply.ReplyDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="question.QuestionDAO"%>
<%@page import="question.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//입력된 검색 대상과 검색 키워드를 반환받아 저장
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	
	//전달된 페이지 번호를 반환받아 저장
	int pageNum=1;
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}

	//페이지에 응답될 게시글의 갯수 설정
	int pageSize=10;//응답 게시글의 갯수를 저장하기 위한 변수
	
	//questiontable 테이블에 저장된 전체 게시글의 갯수를 반환하는 DAO 클래스의 메소드 호출
	int totalQuestion=QuestionDAO.getDAO().getQuestionTotal(search, keyword);
	
	//총 페이지 갯수를 계산하여 저장
	int totalPage=(int)Math.ceil((double)totalQuestion/pageSize);
	
	//전달받은 페이지 번호에 대한 유효성 검사
	if(pageNum<=0 || pageNum>totalPage) {
		//비정상적인 페이지 번호가 전달된 경우 무조건 1 페이지로 설정 
		pageNum=1;
	}
	
	//페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
	// => 1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31,... 
	int startRow=(pageNum-1)*pageSize+1;
		
	//페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
	// => 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 41,... 
	int endRow=pageNum*pageSize;
		
	//마지막 페이지의 게시글 종료 행번호를 게시글 전체 갯수로 변경
	if(endRow>totalQuestion) {
			endRow=totalQuestion;
		}

	//시작 행번호와 종료 행번호를 전달하여 BOARD 테이블에서 페이지에 
		//응답될 게시글 목록을 검색하여 반환하는 DAO 클래스의 메소드 호출
		List<QuestionDTO> questionList=QuestionDAO.getDAO().getpageList(startRow, endRow, search, keyword);
		
		//페이지에 응답될 게시글의 출력시작번호를 계산하여 저장
		// => 게시글이 하나 출력될 때마다 1씩 감소
		int number=totalQuestion-(pageNum-1)*pageSize;
		                    
		//세션으로 공유된 인증정보(회원정보)를 반환받아 저장
		MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
		
		//서버의 현재 날짜(시간)정보 저장
		String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	

%>
<style>
#hover td a {
    color: #3e4149;
    text-decoration: none;
}

#hover td a:hover {
    color: #abcdff;
}
#list th, #list td {
    border: 1px solid #a2c7ff;
    overflow: hidden; 
    text-overflow: ellipsis;
}
</style>

<div id="content">
	<!-- 문의하기 목록 -->
	<div id="section">
	<div id="question_list">
            <div id="question_title">
                <h2><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/question.png" style="height: 22px;">문의하기 관리</h2>
            </div>


		<!-- 게시글 목록 출력 -->
		<div style="width: 1000px;">	
			<table id="list">
			     <colgroup>
                       <col width="100"/>
                       <col width="500"/>
                       <col width="200"/>
                       <col width="200"/>
                       <col width="200"/>
                   </colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>처리상황</th>
				</tr>

				<%if(totalQuestion==0) { %>

				<tr style="text-align: center;">
					<td colspan="5">검색된 게시글이 하나도 없습니다.</td>
				</tr>
				<% }else { %>
				<%--게시글 목록 출력 --%>
				<% for(QuestionDTO question:questionList) { 
					//Reply DAO에 있는 부모번호글을 전달받아서 반환받아 저장
					int parents = (Integer)ReplyDAO.getDAO().getParents(question.getNum()); 
				%>
				<tr id="hover">
					<%--글번호 --%>
					<td style="text-align: center;">
					<%=number %>
					</td>

					<%--제목 --%>
					<td>
						<a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin_detail&num=<%=question.getNum() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>&number=<%=number%>"><%=question.getTitle()%></a>
					</td>

					<%-- 작성자 --%>
					<td style="text-align: center;">
					<%=question.getId() %>
					</td>

					<%-- 작성일 --%>
					<td style="margin-left: 20px; text-align: center;">
						<%if(currentDate.equals(question.getDateCreated().substring(0,10))) {%>
						<%=question.getDateCreated().substring(11,19) %> <%}else{ %> <%=question.getDateCreated().substring(0,19) %>
						<%} %>
					</td>
					
					<%--답변관리 --%>
					<%if(parents==question.getNum()){%>
					
					<td style="margin-left: 20px; text-align: center;">답변완료</td>
					
					<%}else{ %>
					
					<td style="margin-left: 20px; text-align: center; color:#69a5ff; ">답변대기</td>
					
					<%}%>
				</tr>
				
				<% number--; %>
				<% } %>
			<% } %>

			</table>
			
			<%--페이지 번호 출력(페이징 처리) 및 하이퍼 링크 --%>
			<%
			//페이지 블럭에 출력될 페이지 번호의 갯수를 설정하여 저장
			int blockSize=5;//블럭에 출력될 페이지 번호의 갯수를 저장하기 위한 변수
		
			//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 출력
			// => 1 Block(1~5) : 1, 2 Block(6~10) : 6, 3 Block(11~15) : 11, 4(16~20) Block : 16,... 
			int startPage=(pageNum-1)/blockSize*blockSize+1;//블럭에 출력될 페이지 시작 페이지번호를 저장하기 위한 변수
		
			//페이지 블럭에 출력될 마지막 페이지 번호를 계산하여 출력
			// => 1 Block(1~5) : 5, 2 Block(6~10) : 10, 3 Block(11~15) : 15, 4(16~20) Block : 20,...
			int endPage=startPage+blockSize-1;
		
			//마지막 페이지 블럭의 페이지 번호 변경
			if(endPage>totalPage) {
				endPage=totalPage;
			}
			%>
			
			<%--페이지 번호 출력 및 하이퍼 링크 --%>
			<div id="page">
			<% if(startPage>blockSize) {%>
			<a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum=1&search=<%=search %>&keyword=<%=keyword %>">
				 <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"></a>
			<a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
				 <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px"></a>
			<%}else{ %>
				 <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"> 
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px">
			<%} %>
			
			<%for(int i=startPage;i<=endPage;i++){ %>
				<%if(pageNum!=i) { %>
				 <a style="color: #3e4149; text-decoration: none;" href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
				<%}else{ %>
				<span style="font-weight: bold; color: #cadefc;">[<%=i%>]</span>
				<%} %>
			<%} %>
				
			<%if(endPage!=totalPage){ %>
			<a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
				<img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px"></a>	
			<a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">
				<img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px"></a>
			<% } else { %>
				<img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px">
			<% } %>
			</div>
			
			<br>
			<%--게시글 검색 --%>
			<div style="text-align: center;">
				<form action="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin" method="post" id="searchForm">
					<select name="search">
						<option value="title" selected="selected">&nbsp;&nbsp;제목&nbsp;</option>
						<option value="content">&nbsp;내용&nbsp;</option>
					</select>
						<input type="text" name="keyword" id="keyword">
						<button type="submit">검색</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	
	<%-- <script type="text/javascript">
	$("#delete").click(function() {
		if(confirm("정말로 삭제 하시겠습니까?")) {
			$("#questionForm").attr("action", "<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/content/question_admin_remove_action.jsp");
			$("#questionForm").submit();
		}
		});


	$("#replyBtn").click(function() {
		$("#boardForm").attr("action", "<%=request.getContextPath()%>/site/index.jsp?workgroup=board&work=board_write&ref=<%=board.getRef()%>&reStep=<%=board.getReStep()%>&reLevel=<%=board.getReLevel()%>");
		$("#boardForm").submit();
		});

	
	</script>  --%>