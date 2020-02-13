<%@page import="cart.CartDAO"%>
<%@page import="cart.CartDTO"%>
<%@page import="semiProject.*"%>
<%@page import="javafx.scene.control.RadioMenuItem"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐릭터 인코딩
request.setCharacterEncoding("UTF-8");
//DAO DTO 객체 생성
CartDTO cartDTO = new CartDTO();
CartDAO cartDAO = CartDAO.getDAO();

//DTO에 파라미터값 삽입
cartDTO.setId(session.getAttribute("sessionID").toString());
cartDTO.setHairType(request.getParameter("goods_option1"));	//모발 타입 
cartDTO.setHairBold(request.getParameter("goods_option2"));	//모발 굵기
cartDTO.setHairDamage(request.getParameter("goods_option3"));	//모발 손상정도
cartDTO.setHeadType(request.getParameter("goods_option4"));	//두피 타입

String[] value =request.getParameterValues("goods_option5[]");// 제품기능 배열저장
int count =value.length;
String productFuntion = "";
for(int i=0;i<count;i++){
	productFuntion += (value[i]+",");
} 
productFuntion=productFuntion.substring(0, productFuntion.length()-1);//마지막 ',' 지우기
cartDTO.setProductFuntion(productFuntion); //제품 기능 (선택 최대 5가지)

cartDTO.setShampooColor(request.getParameter("goods_option6"));	//샴푸 색상
cartDTO.setConditionColor(request.getParameter("goods_option7")); //컨디셔너 색상
cartDTO.setSmell(request.getParameter("goods_option8"));	//샴푸컨디셔너향
cartDTO.setSmellPower(request.getParameter("goods_option9"));	//향 강도
cartDTO.setCodeName(request.getParameter("codename"));//코드네임
cartDTO.setHashTagOne(request.getParameter("hashtag1"));//해쉬태그 1	
cartDTO.setHashTagTwo(request.getParameter("hashtag2"));//해쉬태그 2
cartDTO.setHashTagThree(request.getParameter("hashtag3"));//해쉬태그 3
cartDTO.setProSelect(request.getParameter("goods_option10")); //제품 구성

//제품구성 별 가격 price에 보내주기.
String price = request.getParameter("goods_option10");
String twoChoice="샴푸+컨디셔너";
if(price.equals(twoChoice)){
	cartDTO.setPrice("22,800원");
}
else{
	cartDTO.setPrice("13,800원");
}

cartDAO.insertcart(cartDTO);

out.println("<script>location.href='../cart.jsp';</script>");
%>