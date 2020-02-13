<%@page import="cart.CartDAO"%>
<%@page import="semiProject.OrderDAO"%>
<%@page import="semiProject.OrderDTO"%>
<%@page import="semiProject.*"%>
<%@page import="javafx.scene.control.RadioMenuItem"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");
//DAO DTO 객체 생성
OrderDTO orderDTO = new OrderDTO();
OrderDAO orderDAO = OrderDAO.getDAO();

//DTO에 파라미터값 삽입
orderDTO.setId(session.getAttribute("sessionID").toString());
orderDTO.setHairType(request.getParameter("orderhairType"));//모발 타입 
orderDTO.setHairBold(request.getParameter("orderhairBold"));	//모발 굵기
orderDTO.setHairDamage(request.getParameter("orderhairDamage"));	//모발 손상정도
orderDTO.setHeadType(request.getParameter("orderheadType"));	//두피 타입
orderDTO.setProductFuntion(request.getParameter("orderproductFunction")); //제품 기능 (선택 최대 5가지)
orderDTO.setShampooColor(request.getParameter("ordershampooColor"));	//샴푸 색상
orderDTO.setConditionColor(request.getParameter("orderconditionColor")); //컨디셔너 색상
orderDTO.setSmell(request.getParameter("ordersmell"));	//샴푸컨디셔너향
orderDTO.setSmellPower(request.getParameter("ordersmellPower"));	//향 강도
orderDTO.setCodeName(request.getParameter("ordercodeName"));//코드네임
orderDTO.setHashTagOne(request.getParameter("orderhashTagOne"));//해쉬태그 1	
orderDTO.setHashTagTwo(request.getParameter("orderhashTagTwo"));//해쉬태그 2
orderDTO.setHashTagThree(request.getParameter("orderhashTagThree"));//해쉬태그 3
orderDTO.setProSelect(request.getParameter("orderproSelect")); //제품 구성
//받는사람 정보
orderDTO.setName(request.getParameter("buyer_name3")); //이름
orderDTO.setPhone(request.getParameter("buyer_tel4")); //핸드폰번호
orderDTO.setPostalCode(request.getParameter("zip3")); //우편번호
orderDTO.setAddress(request.getParameter("address2")); //주소
orderDTO.setDetailAddress(request.getParameter("address2_d")); //상세주소
orderDTO.setMessage(request.getParameter("buyer_main")); // 배송메세지
//무통장입금
orderDTO.setDepositBank(request.getParameter("receipt_bank")); // 입금은행
orderDTO.setDepositName(request.getParameter("buyer_name2")); // 입금자명
orderDTO.setTotalCash(request.getParameter("orderTotalCash")); // 총 금액

orderDAO.insertorder(orderDTO);
String id = session.getAttribute("sessionID").toString();
CartDAO cartDAO = CartDAO.getDAO();
cartDAO.deleteCartId(id);


out.println("<script>location.href='../index2.jsp';</script>");
%>