<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semiProject.OrderDAO"%>
<%@page import="semiProject.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //전달값을 반환받아 저장
    
    String no=request.getParameter("no");
   
    
    // 주문내역 반환 
    List<OrderDTO> orderList = OrderDAO.getDAO().getOrderDetail(no);
    
    
   
// System.out.println("no="+no);
%>

<style>
#notice_detail th {
    text-align: center;
}
#notice_detail th, #notice_detail td {
    border: 1px solid #a2c7ff;
    word-break:break-all;
}
</style>
<div id="content">
    <h2>주문 상세</h2>
    <div style="width: 960px;">
	    <table id="notice_detail" style="border: 1px solid black;">
	        <tr>
	            <th>주문번호</th>
	            <td><%=orderList.get(0).getNo() %></td>
	        </tr>
	        <tr>
	            <th>주문일</th>
	            <td><%=orderList.get(0).getOrderDate()%></td>
	        </tr>
	        <tr>
	            <th>아이디</th>
	            <td><%=orderList.get(0).getId()%></td>
	        </tr>
	        <tr>
	           <th>모발타입</th>
	           <td><%=orderList.get(0).getHairType()%></td>
	        </tr>
	         <tr>
	           <th>모발굵기</th>
	           <td><%=orderList.get(0).getHairBold()%></td>
	        </tr>
	         <tr>
	           <th>모발 손상정도</th>
	           <td><%=orderList.get(0).getHairDamage()%></td>
	        </tr>
	         <tr>
	           <th>두피타입</th>
	           <td><%=orderList.get(0).getHairType()%></td>
	        </tr>
	         <tr>
	           <th>제품기능</th>
	           <td><%=orderList.get(0).getProductFuntion()%></td>
	        </tr>
	         <tr>
	           <th>샴푸컬러</th>
	           <td><%=orderList.get(0).getShampooColor()%></td>
	        </tr>
	         <tr>
	           <th>컨디셔너컬러</th>
	           <td><%=orderList.get(0).getConditionColor()%></td>
	        </tr>
	         <tr>
	           <th>샴푸/컨디셔너 향</th>
	           <td><%=orderList.get(0).getSmell()%></td>
	        </tr>
	         <tr>
	           <th>향의 강도</th>
	           <td><%=orderList.get(0).getSmellPower()%></td>
	        </tr>
	         <tr>
	           <th>코드네임</th>
	           <td><%=orderList.get(0).getCodeName()%></td>
	        </tr>
	        <tr>
	           <th>해쉬태그-1</th>
	        
	        
	        <% 
	        	if(orderList.get(0).getHashTagOne().equals("null")) { %>  
	        	<td></td> 
	        <% } else { %>
	           <td><%=orderList.get(0).getHashTagOne()%></td>
	        <% } %>   
	           
	        </tr>
	         <tr>
	          <th>해쉬태그-2</th>
	        <% 
	        	if(orderList.get(0).getHashTagTwo().equals("null")) { %>  
	        	<td></td> 
	        <% } else { %>
	           <td><%=orderList.get(0).getHashTagTwo()%></td>
	        <% } %> 
	          
	        </tr>
	         <tr>
	           <th>해쉬태그-3</th>
	        <% 
	        	if(orderList.get(0).getHashTagThree().equals("null")) { %>  
	        	<td></td> 
	        <% } else { %>
	           <td><%=orderList.get(0).getHashTagThree()%></td>
	        <% } %> 
	        </tr>
	         <tr>
	           <th>제품구성</th>
	           <td><%=orderList.get(0).getProSelect()%></td>
	        </tr>
	         
	        
	    </table>
	</div>
</div>


