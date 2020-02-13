<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

    		
	String search=request.getParameter("search");
	if(search==null) search="";
	
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";
	
	  //전달된 페이지번호를 반환받아 저장
    int pageNum=1;//페이지번호를 저장하기 위한 변수
    if(request.getParameter("pageNum")!=null) {//전달값이 존재할 경우
        pageNum=Integer.parseInt(request.getParameter("pageNum"));
    }
    
    //페이지에 응답될 게시글의 갯수 설정
    int pageSize=8;//응답 게시글의 갯수를 저장하기 위한 변수
    
    // 전체 게시글 수 
    int totalNotice = MemberDAO.getDAO().getMemberTotal(search, keyword);
    
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
	
 	List<MemberDTO> memberSearchList = MemberDAO.getDAO().getMemberSearchList(startRow, endRow, search, keyword);
 	
 	 // 페이지당 회원목록의 출력시작번호 계산
    int number = totalNotice - (pageNum-1)*pageSize;
 	
 	// 휴면계정 자동 업데이트
 	int rows = MemberDAO.getDAO().modifyMemberDate();
 	
 	%>
<%--	
<style>
#member1 { display: table-row; }
#member2 { display: none; }
</style>
--%>	
<style>
#optionArea th, #optionArea td {
    border: 1px solid #a2c7ff;
}    
#optionArea2 th, #optionArea2 td {
    border: 1px solid #a2c7ff;   
}
</style>  
<div id="content" >
    <!-- 회원 검색 -->
    <div id="header">
        <h2>회원검색</h2>
    </div>
    <div id="section1">
        <div>    
        <form action="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin" method="post"  name="memberSearchForm" id="memberSearchForm">
            <table id="optionArea" border="1">
                <caption>회원정보 조회</caption>
                <colgroup>
                    <col width="140px" />
                    <col width="670px" />
                    <col width="150px" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">검색어</th>
                    <td>
                        <select name="search" class="fSelect">
                            <option value="" selected>---- 선택 ----</option>
                            <option value="name">이름</option>
                            <option value="id">아이디</option>
                            <option value="phone">휴대폰번호</option>
                        </select>
                        <input type="text" name="keyword" id="keyword" style="width:240px;">
                    </td>
                    <td style="text-align: center; padding: 5px">
                           <button id="selectWordBtn" type="submit" value="검색">검색</button>
                           <button id="resetWordBtn" type="button" value="초기화">초기화</button>
                    </td>
                </tr>
                <div id="searchMsg" style="width:500px; text-align: left; color: red; position: relative; display: none;">검색 결과가 없습니다.</div>
               <%-- 
                <tr>
                    <th scope="row">가입일</th>
                    <td>
                        <div>
                            <input type="date" id="regist_start_date">  -  
                            <input type="date" id="regist_end_date" max="sysdate">
                        </div>    
                    </td>
                    <td tyle="text-align: center; padding: 5px">
                           <input id="selectDateBtn" type="button" value="검색">
                           <input id="resetDateBtn" type="button" value="초기화">
                    </td>
                </tr>
                --%>
                </tbody>
            </table>
            </form>
        </div>
    </div>

    <!-- 회원 목록 -->
    <div>
        <h2>회원목록</h2> 
    </div>
    <div id="section2">  	
    <form name="memberForm" id="memberForm">
            <table id="optionArea2">     
                <colgroup>
                	<col width="80px" />
                    <col width="80px" />
                    <col width="200px" />
                    <col width="150px" />
                    <col width="160px" />
                    <col width="60px" />
                    <col width="160px" />
                    <col width="150px" />
                    <col width="210px" />
                </colgroup>
               
                <tbody>
                    <tr id="option">
                    	<th><input type="checkbox" id="allCheck"></th>
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>주소</th>
                        <th>성별</th>
                        <th>생일</th>
                        <th>연락처</th>
                        <th>최근로그인/휴면계정</th>
                    </tr>
 
              		<% for(MemberDTO member:memberSearchList) { %>
   					
                    <tr>
                    	<%-- 멤버 상태 --%>
                    	<th>
						<% if(Integer.parseInt(member.getAuthority())==9) { %>
							관리자
						<% } else { %>
							<input type="checkbox" name="checkId" value="<%=member.getId()%>" class="check">
						<% } %>
						</th>
                        <%-- 회원번호 --%>
                        <th><%=member.getMemberNo() %></th>
                        <%-- 아이디 --%>	
                        <th><%=member.getId() %></th>
						<%-- 비밀번호
                        <th><%=member.getPassword() %></th> --%>
                        <%-- 이름 --%>
                        <th><%=member.getName() %></th>
                        <%-- 주소 --%>
                        <th><%=member.getAddress() %></th>
                        <%-- 성별 --%>
                        <th><%=member.getSex() %></th>
                        <%-- 생일 --%>
                        <th><%=member.getBirthday() %></th>
                        <%-- 연락처 --%>
                        <th><%=member.getPhone() %></th>
                        <%-- 휴면계정 --%>
                        <th><%if(Integer.parseInt(member.getAuthority())==2){ %>
                        휴면계정
                        <%} else { %>
                        <%=member.getMemberDate().substring(0,10) %>
                        <%} %>
                        </th>
                    </tr>
                   <% } %>
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
			    <div id="page" style=" width: 1250px;">
			    <% if(startPage>blockSize) { %>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px"></a>
			    <% } else { %>
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"> 
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px">
			    <% } %>
			    
			    <% for(int i=startPage;i<=endPage;i++) { %>
			        <% if(pageNum!=i) { %>
			        <a style="color: #3e4149; text-decoration: none;" href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
			        
			        <% } else { %>
			        <span style="font-weight: bold; color: #cadefc;">[<%=i %>]</span>
			        <% } %>
			    <% } %>
			    
			    <% if(endPage!=totalPage) { %>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px"></a>
			    <% } else { %>
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px">
			    <% } %>
			    </div>
		</form>
       <p><button type="button" id="removeBtn">선택회원삭제</button></p>
<div id="message" style="color: red;"></div>
        </div>
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
		$("#message").text("선택한 회원이 하나도 없습니다.");
		return;
	}
	
	$("#memberForm").attr("method","post");
	$("#memberForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/content/member_admin_remove_action.jsp");
	$("#memberForm").submit();
});



$("#resetWordBtn").click(function() {
	

	$("#memberSearchForm").attr("method","post");
	$("#memberSearchForm").attr("action","<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin");
	$("#memberSearchForm").submit();
	
});


</script>

