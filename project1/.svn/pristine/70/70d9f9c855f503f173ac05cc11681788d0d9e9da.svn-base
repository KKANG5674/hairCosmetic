<%@page import="semiProject.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="semiProject.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");
	if (search == null)
		search = "";
	String keyword = request.getParameter("keyword");
	if (keyword == null)
		keyword = "";
	
	  //전달된 페이지번호를 반환받아 저장
    int pageNum=1;//페이지번호를 저장하기 위한 변수
    if(request.getParameter("pageNum")!=null) {//전달값이 존재할 경우
        pageNum=Integer.parseInt(request.getParameter("pageNum"));
    }
    
    //페이지에 응답될 게시글의 갯수 설정
    int pageSize=8;//응답 게시글의 갯수를 저장하기 위한 변수
    
    // 전체 게시글 수 
    int totalNotice = OrderDAO.getDAO().getOrderTotal(search, keyword);
    
    // 총 페이지 갯수
    int totalPage = (int)Math.ceil((double)totalNotice/pageSize);
    
    // 페이지 유효성 검사
    if(pageNum<=0 || pageNum>totalPage) {
        pageNum = 1;
    }
    // 시작행 번호 계산
    int startRow = (pageNum-1) * pageSize +1;
    
    // 종료행 번호 계산
    int endRow = pageNum * pageSize;
    
    // 마지막 페이지 종료 행번호를 게시글 전체 갯수로 변경
    if(endRow>totalNotice) {
        endRow = totalNotice;
    }
	
	List<OrderDTO> orderSearchList = OrderDAO.getDAO().getorderSearchList(startRow, endRow, search, keyword);
	
	// 페이지당 회원목록의 출력시작번호 계산
    int number = totalNotice - (pageNum-1)*pageSize;
 	
%>

<style>
#optionArea th, #optionArea td {
    border: 1px solid #a2c7ff;
}
#selectWordBtn, #resetWordBtn, input[type="button"] {
    text-align: center;
    border: 1px solid #cadefc;
    background: #cadefc;
    color: #3e4149;
}
#hover th a {
    color: #3e4149;
    text-decoration: none;
}

#hover th a:hover {
    color: #abcdff;
}
</style>
<div id="content">

	<div id="header">
		<h2>주문관리</h2>
	</div>
	<div id="section">
		<div>
			<form name="orderSelectForm" id="orderSelectForm">
				<table id="optionArea">
					<caption>주문관리 조회</caption>
					<colgroup>
						<col width="140px" />
						<col width="670px" />
						<col width="150px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">검색어</th>
							<td><select name="search" class="fSelect">
									<option value="" selected>---- 선택 ----</option>
									<option value="no">주문번호</option>
									<option value="id">아이디</option>
									<option value="ordername">이름</option>
							</select> <input type="text" name="keyword" id="keyword"
								style="width: 240px;"></td>

							<td rowspan="3" style="text-align: center; padding: 5px"><input
								id="selectWordBtn" type="submit" value="검색"> <input
								id="resetWordBtn" type="button" value="초기화"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	</div>

	<!-- 주문 목록 -->

	<div id="section">
		<form name="orderForm" id="orderForm">
			<table id="optionArea2">
				<caption>주문정보검색목록</caption>
				<colgroup>
					<col width="120px" />
					<col width="80px" />
					<col width="80px" />
					<col width="190px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="140px" />
					<col width="140px" />
					<col width="140px" />
					<col width="140px" />
					<col width="140px" />
				</colgroup>
				<tbody>
					<tr id="option">
						<th><input type="checkbox" id="allCheck"></th>
						<th>주문일</th>
						<th>주문번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>상품</th>
						<th>결제완료여부</th>
						<th>배송상태</th>
						<th>입금은행</th>
						<th>입금자명</th>
						<th>총금액</th>
						<th id="check">체크</th>
					</tr>
					<%
					int count = 0;
						for (OrderDTO order : orderSearchList) {
					%>
					<tr id="hover">
						<th><input type="checkbox" name="checkId"
							value="<%=orderSearchList.get(count).getNo() %>" class="check"></th>
						<%-- 주문 상태 --%>
						<%-- 주문일 --%>
						<th><%=orderSearchList.get(count).getOrderDate()%></th>
						<%-- 주문번호 --%>
						<th><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin_information&no=<%=order.getNo() %>"><%=orderSearchList.get(count).getNo()%>
						</a></th>
						<%-- 아이디 --%>	
						<th><%=orderSearchList.get(count).getId()%>
						</th>
						<%-- 이름 --%>
						<th><%=orderSearchList.get(count).getName()%></th>
						<%-- 상품 --%>
						<th><%=orderSearchList.get(count).getProSelect()%></th>
						<%-- 결제완료여부 --%>
						<th><%if(orderSearchList.get(count).getPayment().equals("결제대기")){%>
							<select name="search<%=count %>" class="fSelect">
								<option value="결제대기" selected>결제대기</option>
								<option value="결제완료">결제완료</option></select>
						<%}else{
						%>
							<select name="search<%=count %>" class="fSelect">
								<option value="결제대기">결제대기</option>
								<option value="결제완료"selected>결제완료</option></select>
						<% }%>
						</th>
						<%-- 배송상태 --%>
						<th><%if(orderSearchList.get(count).getDelivery().equals("배송준비")){%>
							<select name="search2<%=count %>" class="fSelect">
								<option value="배송준비" selected>배송준비</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option></select>
						<%}else if(orderSearchList.get(count).getDelivery().equals("배송중")){%>
							<select name="search2<%=count %>" class="fSelect">
							<option value="배송준비">배송준비</option>
							<option value="배송중" selected>배송중</option>
							<option value="배송완료">배송완료</option></select>
						<%} else if(orderSearchList.get(count).getDelivery().equals("배송완료")){%>
							<select name="search2<%=count %>" class="fSelect">
							<option value="배송준비" >배송준비</option>
							<option value="배송중">배송중</option>
							<option value="배송완료" selected>배송완료</option></select>
						<% }%>
						</th>
						<%-- 입금은행 --%>
						<th><%=orderSearchList.get(count).getDepositBank()%></th>
						<%-- 입금자명 --%>
						<th><%=orderSearchList.get(count).getDepositName()%></th>
						<%-- 현금영수증 --%>
						<th><%=orderSearchList.get(count).getTotalCash()%></th>
						<th><input id="updateBtn<%=count %>" type="button" value="변경">
							<input type="hidden" name="orderNumber<%=count %>" value="<%=orderSearchList.get(count).getNo()%>">
						</th>
					</tr>
					
					<%
					count++;}
					%>

				</tbody>
			</table>
			 <%
			        //페이지 블럭에 출력될 페이지 번호의 갯수를 설정하여 저장
			        int blockSize=5;
			        
			        //페이지 블럭에 출력될 시작 페이지 번호를 계산하여 출력
			        int startPage=(pageNum-1)/blockSize*blockSize+1;
			        
			        //페이지 블럭에 출력될 마지막 페이지 번호를 계산하여 출력
			        int endPage=startPage+blockSize-1;
			        
			        //마지막 페이지 블럭의 페이지 번호 변경
			        if(endPage>totalPage) {
			            endPage=totalPage;
			        }
		        %>
		        
		        <%-- 페이지 번호 출력 및 하이퍼 링크 --%>
			    <div id="page">
			    <% if(startPage>blockSize) { %>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px"></a>
			    <% } else { %>
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"> 
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px">
			    <% } %>
			    
			    <% for(int i=startPage;i<=endPage;i++) { %>
			        <% if(pageNum!=i) { %>
			        <a style="color: #3e4149; text-decoration: none;" href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
			        
			        <% } else { %>
			        <span style="font-weight: bold; color: #cca8e9;">[<%=i %>]</span>
			        <% } %>
			    <% } %>
			    
			    <% if(endPage!=totalPage) { %>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px"></a>
			    <% } else { %>
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px">
			    <% } %>
			    </div>
		</form>
		<p>
			<button type="button" id="removeBtn">선택주문삭제</button>
		</p>
		<div id="message" style="color: red;"></div>
	</div>


	<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}	
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").size()==0) {
		$("#message").text("선택한 주문이 하나도 없습니다.");
		return;
	}
	
	
	$("#orderForm").attr("method","post");
	$("#orderForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/content/order_admin_remove_action.jsp");
	$("#orderForm").submit();
});

$("#selectWordBtn").click(function() {
	
	 
	$("#orderSelectForm").attr("method","post");
	$("#orderSelectForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin");
	$("#orderSelectForm").submit();
	
});

for(i=0;i<<%=count%>;i++){
	$("#updateBtn"+i).click(function() {
		
		var id_check = $(this).attr("id");
		$("#orderForm").attr("method","post");
		$("#orderForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/content/order_admin_action.jsp?count="+id_check);
		$("#orderForm").submit();
		
	});	

}
$("#resetWordBtn").click(function() {
	
	$("#keyword")
	$("#orderSelectForm").attr("method","post");
	$("#orderSelectForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin");
	$("#orderSelectForm").submit();

});


	</script>