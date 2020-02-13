<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 비정상적 요청에 대한 응답처리
    if(request.getParameter("num")==null) {
        out.println("<script>");
        out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/faq.jsp?work=faq_notice';");
        out.println("</script>");
        return;
    }

    //전달값을 반환받아 저장
    int num=Integer.parseInt(request.getParameter("num"));
    String pageNum=request.getParameter("pageNum");
    String search=request.getParameter("search");
    String keyword=request.getParameter("keyword");
    
    // 게시글 검색 반환 
    NoticeDTO notice = NoticeDAO.getDAO().getNotice(num);
    
    // => 검색된 게시글이 없거나 삭제된 게시글인 경우
    if(notice==null) {
        out.println("<script>");
        out.println("location.href='"+request.getContextPath()+"/codeforbeauty.com/shop/faq.jsp?work=faq_notice';");
        out.println("</script>");
        return;
    }
    
    // 조회수 1 증가
    NoticeDAO.getDAO().modifyReadCount(num);

%>


<style>
.notice_detail th, .notice_detail td{
	word-break:break-all;
}
</style>


<div id="content">
    <div style="width: 960px;">
        <table id="notice_detail">
            <tr>
                <th style="text-align: center;">작성자</th>
                <td>관리자</td>
            </tr>
            <tr>
                <th style="text-align: center;">작성일</th>
                <td><%=notice.getDateCreated().substring(0, 10) %></td>
            </tr>
            <tr>
                <th style="text-align: center;">제목</th>
                <td class="title">
                    <%=notice.getTitle() %>
                </td>
            </tr>
            <tr>
                <th style="text-align: center; padding-top: 35px;">내용</th>
                <td class="content" style=" height: 500px; vertical-align: text-top;">
                    <%=notice.getContent().replace("\n", "<br>") %>
                </td>
            </tr>
        </table>
        <br>
        <div style="margin-left: 20px; text-align: center;">
            <button type="button" id="listBtn">목록</button>
        </div>
    </div>
</div>

<form id="noticeForm" method="post">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="pageNum" value="<%=pageNum%>">
    <input type="hidden" name="search" value="<%=search%>">
    <input type="hidden" name="keyword" value="<%=keyword%>">
</form>

<script type="text/javascript">

$("#listBtn").click(function() {
    $("#noticeForm").attr("action", "<%=request.getContextPath()%>/codeforbeauty.com/shop/faq.jsp?work=faq_notice");
    $("#noticeForm").submit();
});
</script>