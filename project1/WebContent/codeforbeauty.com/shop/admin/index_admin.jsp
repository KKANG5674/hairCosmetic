<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- https://www.w3schools.com/css/tryit.asp?filename=trycss_website_layout_blog -->
<%
	request.setCharacterEncoding("UTF-8");  

    String workgroup=request.getParameter("workgroup");
    if(workgroup==null) workgroup="content";
    
    String work=request.getParameter("work");
    if(work==null) work="main_admin";
    
    String contentPath=workgroup+"/"+work+".jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>code for beauty admin</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="shortcut icon" href="http://textrip.designclick.co.kr/shop/skin/mall_dc/image/favicon/codeforbeauty.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/css/style.css">
</head>
<body>
<div class="wrap">
    <div class="header">
        <div><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp">
                <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/logo_represent.png"></a></div>
    </div>
    
    <div class="topnav" >
       <ul style="float:right;">
           <li>
            <a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/index2.jsp" target="blank">
            <!-- 그림에 마우스 올려야만 바뀜... -->
            <img id="homepage" src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/homepage.png" 
            onmouseover="this.src='<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/homepage_hover.png'"
            onmouseout="this.src='<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/homepage.png';"
            style="width: 20px; margin-right: 5px;"/> mall</a></li>
<!--            <li>
            <a href="index.jsp?workgroup=content&work=setting">
            <img id="settings" src="images/settings.png"
            onmouseover="this.src='images/settings_hover.png'"
            onmouseout="this.src='images/settings.png';"
            style="width: 20px; margin-right: 5px;">setting</a></li> -->
       </ul>
    </div>
    
    <div class="container">
       <div class="sidenav">
	       <ul>
	           <li id="click"><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=member_admin">
	               <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/user.png">회원관리</a></li>
	           <hr>
	           <li id="click"><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=order_admin">
	                <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/shopping.png">주문관리</a>
	           </li>
	           <hr>
	           <li><a href="">
	                <img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/clipboard.png">게시판관리</a>
	               <ul>
	                   <li id="click"><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin_write">공지사항 등록</a></li>
	                   <li id="click"><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=notice_admin">공지사항 관리</a></li>
	                   <!-- <li id="click"><a href="index.jsp?workgroup=content&work=notice_admin">공지사항 설정</a></li> -->
	                   <li id="click"><a href="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/index_admin.jsp?workgroup=content&work=question_admin">문의하기 관리</a></li>
	                   <!-- <li id="click"><a href="index.jsp?workgroup=content&work=question_admin">문의하기 설정</a></li> -->
	               </ul>
	           </li>
	       </ul>
        </div>
		<div class="content">
		  <jsp:include page="<%=contentPath %>"/>
		</div>
    </div>   
</div>

</body>
</html>