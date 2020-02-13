<%@page import="notice.NoticeDTO"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
    // 비정상 요청 응답처리
    if(request.getMethod().equals("GET")) {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        return;
    }
 */
    // POST 방식으로 요청되어 전달된 값에 대한 캐릭터셋 변경
    request.setCharacterEncoding("UTF-8");

    // 입력값 반환받아 저장
    String pageNum=request.getParameter("pageNum");

/*     // XSS 처리
    String title = Utility.stripTag(request.getParameter("title"));
    String content = Utility.stripTag(request.getParameter("content")); */
    String title = request.getParameter("title");
    String content = request.getParameter("content");

/*     // 입력값 없을 경우 처리
    if(title==null|| title.equals("") || content==null || content.equals("")) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
    } */

    // NOTICE_SEQ 자동증가값 
    int num = NoticeDAO.getDAO().getNoticeNum();

    //세션으로 공유된 인증정보(회원정보)를 반환받아 저장
/*     MemberDTO id = (MemberDTO)session.getAttribute("id"); */
/*     String id = "tester"; */
    
    // DTO 인스턴스 생성 후 필드 값 변경
    NoticeDTO notice = new NoticeDTO();
    notice.setNum(num);
    notice.setTitle(title);
    notice.setContent(content);
/*     notice.setId(id.getId()); */
/*     notice.setId(id); */
    
    // DAO 메소드 호출 - 삽입
    NoticeDAO.getDAO().addNotice(notice);
    
    // 목록페이지 이동
    response.sendRedirect(request.getContextPath() + "/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin&pageNum=" + pageNum);
    
    
%>