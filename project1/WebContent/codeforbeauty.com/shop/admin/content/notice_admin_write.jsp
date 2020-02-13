<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String pageNum="1";//요청 페이지 번호
%>
<style>
#notice_input th {
    text-align: center;
}

#notice_input th, #notice_input td {
    border: 1px solid #a2c7ff;
}
</style>
<div id="content">
    <div id="header">
        <h2><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/write.png" style="height: 22px;">공지사항 입력</h2>
    </div>
    <div>
        <form action="<%=request.getContextPath() %>/codeforbeauty.com/shop/admin/content/notice_admin_write_action.jsp" method="post" id="noticeForm">
        <input type="hidden" name="pageNum" value="<%=pageNum%>">

        <table id="notice_input">
            <colgroup>
                    <col width="140px" />
                    <col />
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" name="title" id="title" style="width: 95%; max-width:450px;" placeholder="[상품/배송/주문/공지] 공지사항 제목"></td>
                </tr>
                <tr>
                    <th scope="row">내용</th>
                    <td>
                    <textarea name="content" id="content" cols="60" rows="10" placeholder="공지사항입니다."
                              style="margin: 0px; width: 95%; resize: vertical; "></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div colspan="2" style="text-align: center; width: 70%; height: 40px; padding: 2px;">
            <button type="submit" id="saveBtn">글저장</button>
            <button type="reset" id="resetBtn">다시입력</button>
       </div>
        </form>
    </div>
</div>