<%@page import="notice.NoticeDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 검색대상/ 검색 키워드 반환받아 저장
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
    int pageSize=10;//응답 게시글의 갯수를 저장하기 위한 변수
    
    // 전체 게시글 수 
    int totalNotice = NoticeDAO.getDAO().getNoticeTotal(search, keyword);
    
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
    
    // 페이지마다 목록 검색 후 반환
    List<NoticeDTO> noticeList = NoticeDAO.getDAO().getNoticeList(startRow, endRow, search, keyword);
    
    // 페이지당 게시글의 출력시작번호 계산
    int number = totalNotice - (pageNum-1)*pageSize;
    
    // 회원정보 저장
/*     MemberDTO id = (MemberDTO)session.getAttribute("id"); */
    
    // 서버 현재 날짜 저장
    String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    
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
    <!-- 공지사항 목록 -->
    <div id="section">
        <div id="notice_list">
            <div id="notice_title">
                <h2><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/notice.png" style="height: 22px;">공지사항 관리</h2>
            </div>
            <div id="btn">
                <input type="button" id="writeBtn" value="글쓰기" >
            </div>
            
            <!-- 게시글 목록 출력 -->
            <div style="width: 1000px;">
	            <table id="list">
	               <colgroup>
	                   <col width="100"/>
	                   <col width="500"/>
	                   <col width="100"/>
	                   <col width="100"/>
	                   <col width="200"/>
	               </colgroup>
	                <tr>
	                    <th >번호</th>
	                    <th>제목</th>
			            <th>작성자</th>
			            <th>조회수</th>
			            <th>작성일</th>
	                </tr>
	                <% if(totalNotice==0) { %>
	                <tr style="text-align: center;">
	                    <td colspan="5">검색된 게시글이 하나도 없습니다.</td>
	                </tr>
	                <% } else { %>
	                    <%-- 게시글 목록 출력 --%>
	                    <% for(NoticeDTO notice:noticeList) { %>
	                <tr id="hover">    
	                    <%-- 글번호 --%>
	                    <td style="text-align: center;"><%=number %></td>
	                    <%-- 제목 --%>
	                    <td>
	                    <%-- 게시글 상태에 따른 제목 출력 및 하이퍼 링크 --%>
	                    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin_detail&num=<%=notice.getNum() %>&pageNum=<%=pageNum %>&search=<%=search%>&keyword=<%=keyword%>"><%=notice.getTitle() %></a>
	                    </td>
	                    <%-- 아이디 --%>
	                    <td style="text-align: center;"><%=notice.getId() %></td>
	                    <%-- 조회수 --%>
	                    <td style="text-align: center;"><%=notice.getCount() %></td>
	                    <%-- 작성일 --%>
	                    <td style="text-align: center;">
	                        <% if(currentDate.equals((String)notice.getDateCreated().substring(0,10))) { %>
	                            <%=notice.getDateCreated().substring(11, 19) %>
	                        <% } else { %>
	                            <%=notice.getDateCreated().substring(0, 19) %>
	                        <% } %>
	                    </td>
	                </tr>
	                <% number--; %> 
	                    <% } %>
	                <% } %>
	            </table>
	            <%-- 페이지 번호 출력(페이징 처리) 및 하이퍼 링크 --%>
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
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			         <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px"></a>
			    <% } else { %>
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/1.png" height="15px"> 
			     <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/2.png" height="13px">
			    <% } %>
			    
			    <% for(int i=startPage;i<=endPage;i++) { %>
			        <% if(pageNum!=i) { %>
			        <a style="color: #3e4149; text-decoration: none;" href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
			        
			        <% } else { %>
			        <span style="font-weight: bold; color: #cadefc;">[<%=i %>]</span>
			        <% } %>
			    <% } %>
			    
			    <% if(endPage!=totalPage) { %>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px"></a>
			    <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px"></a>
			    <% } else { %>
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/3.png" height="13px">
			    <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/4.png" height="15px">
			    <% } %>
			    </div>
			    <br>
			    <%-- 게시글 검색 --%>
			    <div style="text-align: center;">
				    <form action="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin" method="post" id="searchForm">
				        <select name="search">
				            <option value="title" selected="selected">&nbsp;제목&nbsp;</option>
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

<script type="text/javascript">
$("#writeBtn").click(function() {
    location.href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin_write";
});
</script>