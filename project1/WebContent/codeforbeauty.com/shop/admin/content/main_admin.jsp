<%@page import="semiProject.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat(" yyyy년 MM월 dd일 E요일 a hh:mm:ss ");
 
 String today = sf.format(now);
 
 int orderCount = OrderDAO.getDAO().getOrderCount();
 int saleCount = OrderDAO.getDAO().getSaleCount();
 
 DecimalFormat df = new DecimalFormat("###,###,###");
 String orderTotal = df.format(OrderDAO.getDAO().getOrderTotal()); 
 String saleTotal = df.format(OrderDAO.getDAO().getSaleTotal()); 

 
 int orderBefore = OrderDAO.getDAO().getOrderBefore();
 int orderReady = OrderDAO.getDAO().getOrderReady();
 int orderDo = OrderDAO.getDAO().getOrderDo();
 int orderDone = OrderDAO.getDAO().getOrderDone();
 

%>
<style>
#content {
    width: 1660px;
    height: 100%;
}
.main_title{
    width: 1660px;
    background: #f7faff;
    height: 310px;
}
.main_title, .main_header {
    margin-top: 30px;
    margin-bottom: 30px;
}
.main_header{
    width: 100%;
    padding-top: 5px;
}
.main_header div {
    padding-left: 20px;
}
#order, #sale {
    width: 785px;
    height: 200px;
    float: left;
    padding: 85px 40px;
    font-size: 30px;
    font-weight: bold;
    margin-right: 30px;
    background: #e8f2ff;
    color: #3e4149;
}
#order{
    margin-left: 30px;
}
#order div, #sale div {
    float: left;
    padding-left: 50px; 
    padding-right: 50px; 
}

#order_status div {
    width: 385px;
    margin-right: 20px;
    float: left;
}
#option_before {
    margin-left: 20px;   
}

#option_before, #option_ready, #option_do, #option_done {
    margin-right: 20px;
    height: 200px;
    background: #e8f2ff;
}
#status {
    width: 100%;
    height: 100px;
    font-weight: bold;
    color: #3e4149;
    padding-top: 37.5px;
    padding-bottom:0;
    font-size: 25px;
    text-align: center;
}
#order_status_count {
    font-size: 40px;
    margin-right: 20px;
    padding-bottom: 30px;
    padding-top:0;
    width: 100%;
    height: 100px;
    text-align: center;
    color: #cca8e9;
}

</style>
<div id="content">

<!-- 오늘 매출 현황 -->
<div class="main_title">
    <div class="main_header">
        <div><h2>오늘 매출 현황 (<%= today %> 기준)</h2></div>
    </div>
    <div id="order">
    <div><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/order.png" style="height: 30px;">&nbsp; &nbsp;주문 ( <%=orderCount %>건 )</div>
    <div style="float:right;"><%=orderTotal %>원</div>
    </div>
    <div id="sale">
    <div><img src="<%=request.getContextPath()%>/codeforbeauty.com/shop/admin/images/sale.png" style="height: 30px;">&nbsp; &nbsp;결제 ( <%=saleCount %> 건)</div>
    <div style="float: right;"><%=saleTotal %>원</div>
    
    </div>
</div>
<!-- 주문현황 -->
<div class="main_title" style="margin-top: 30px;">
    <div class="main_header">
        <div><h2>주문현황 </h2></div>
    </div>
    <div id="order_status">
        <div id="option_before">
            <div id="status">입금전</div>
            <div id="order_status_count"><%=orderBefore %> 건</div>
        </div>
        <div id="option_ready">
            <div id="status">배송준비</div>
            <div id="order_status_count"><%=orderReady %> 건</div>
        </div>
        <div id="option_do">
            <div id="status">배송중 </div>
            <div id="order_status_count"><%=orderDo %> 건</div>
        </div>
        <div id="option_done">
            <div id="status">배송완료 </div>
            <div id="order_status_count"><%=orderDone %> 건</div>
        </div>
    </div>
</div>

</div>