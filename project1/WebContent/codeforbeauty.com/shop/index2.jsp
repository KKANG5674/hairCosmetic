<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>    
<% if (session.getAttribute("sessionID")==null) {}
else{
  
 //관리자권한인 사람만 관리자페이지가 보인다.
 String id = session.getAttribute("sessionID").toString();
       
 	// 세션에 저장된 아이디를 가져와서
    // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDTO member = new MemberDTO();
        member.setId(id);
        MemberDAO dao =  MemberDAO.getDAO();
        int authority = dao.AuthorityCheck(member);
   
      if(authority==9){ %>
           location.href='<%=request.getContextPath()%>/codeforbeauty.com/shop/mypage.jsp';
    	<%  }} %>    
   
</script>     
    
<!DOCTYPE html>
<html> 
<!-- Mirrored from codeforbeauty.com/shop/index.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:29:38 GMT -->
<head>
  <title>코드포뷰티 맞춤형 샴푸 컨디셔너</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="description" content="맞춤형 샴푸 컨디셔너 코드포뷰티" />
  <meta name="keywords" content="맞춤형, 샴푸, 컨디셔너, 헤어케어, 코드포뷰티, 맞춤샴푸, 나만의, 뷰티, 아이템, 뷰티아이템">
  <meta name="author" content="코드포뷰티" />
  
  <meta property="fb:app_id" content="249302669109601"/>
  <meta property="og:type" content="website">
  <meta property="og:title" content="코드포뷰티">
  <meta property="og:description" content="코드포뷰티 맞춤형 헤어케어" />
  <meta property="og:image" content="../etc/logo_represent.png" />
  <meta property="og:url" content="http://www.codeforbeauty.com/">


  <link rel="stylesheet" type="text/css" href="skin/mall_dc/css/style.css">

  <!-- 삼선메뉴 -->
  <link rel="stylesheet" type="text/css" href="http://html.designclick.co.kr/404.html">
  <link rel="stylesheet" href="../../netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


 </head>


 <body oncontextmenu='return false' ondragstart='return false' onselectstart='return false'>

<div id="pc">

	  <div class="parallax" style="background-image:url('skin/mall_dc/image/Main/main_visual.png'); height:769px; background-repeat: no-repeat; background-position: center;">
		 <div style="width:100%; max-width:940px; margin:0 auto; text-align:center;">
			<ul>
				<li>
					<div>
						<ul>
							<li class="language">
								<!-- <a href=""><span><img src="./skin/mall_dc/image/Main/language_icon.png"></span> Korea ▼</a> -->
							 </li>
						</ul>
					</div>

					<div>
						<ul>
							<li class="logo">
								<svg width="200px" height="37px" viewBox="0 0 200 37" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
								<!-- Generator: Sketch 48.2 (47327) - http://www.bohemiancoding.com/sketch -->
								<title>CFB Logo bk</title>
								<desc>Created with Sketch.</desc>
								<defs></defs>
								<g id="GNB" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-860.000000, -40.000000)">
									<g id="CFB-Logo-bk" transform="translate(860.000000, 40.000000)" fill="#191919" fill-rule="nonzero">
										<path d="M70.5797101,6.50724638 L72.1304348,6.50724638 L72.1304348,6.42028986 C72.1304348,2.57971014 73.9275362,1.63768116 77.057971,1.63768116 L77.884058,1.63768116 L77.884058,4.53623188 L77.1449275,4.53623188 C75.942029,4.53623188 75.5072464,5 75.5072464,6.50724638 L77.3043478,6.50724638 L77.3043478,9.4057971 L75.5072464,9.4057971 L75.5072464,21.9130435 L72.1304348,21.9130435 L72.1304348,9.43478261 L70.5797101,9.43478261 L70.5797101,6.50724638 Z" id="Shape"></path>
										<path d="M78.6521739,10.942029 C78.6521739,8.1405846 80.9231933,5.86956522 83.7246377,5.86956522 C86.5260821,5.86956522 88.7971014,8.1405846 88.7971014,10.942029 L88.7971014,17.3913043 C88.9181626,18.7663176 88.4242916,20.1243808 87.4482492,21.1004231 C86.4722069,22.0764655 85.1141437,22.5703366 83.7391304,22.4492754 C82.3593303,22.5795059 80.9930304,22.0897012 80.0102322,21.112503 C79.0274341,20.1353049 78.52983,18.7718261 78.6521739,17.3913043 L78.6521739,10.942029 Z M81.884058,17.3913043 C81.7647963,18.3835924 82.4716644,19.2850114 83.4637681,19.4057971 L83.7101449,19.4057971 C84.2269379,19.409594 84.7203509,19.1907202 85.064387,18.8050668 C85.4084231,18.4194134 85.5697773,17.9043143 85.5072464,17.3913043 L85.5072464,10.8550725 C85.5732255,10.3783484 85.4468001,9.89496327 85.1558686,9.51158622 C84.8649371,9.12820917 84.4334132,8.8763527 83.9565217,8.8115942 L83.7101449,8.8115942 C83.1857062,8.807863 82.684979,9.02979582 82.3355204,9.42085663 C81.9860618,9.81191743 81.8216099,10.3343517 81.884058,10.8550725 L81.884058,17.3913043 Z" id="Shape"></path>
										<path d="M97.1014493,9.05797101 L95.7826087,9.05797101 C94.5797101,9.05797101 94.173913,9.55072464 94.173913,11.1449275 L94.173913,21.9275362 L90.8695652,21.9275362 L90.8695652,10.942029 C90.8695652,7.42028986 91.9565217,6.04347826 95.4202899,6.04347826 L97.1014493,6.04347826 L97.1014493,9.05797101 Z" id="Shape"></path>
										<polygon id="Shape" points="97.1014493 29.1884058 70.5797101 29.1884058 70.5797101 25.8115942 97.1014493 25.8115942"></polygon>
										<path d="M11.5942029,29.1884058 L6.79710145,29.1884058 C2.31884058,29.1884058 0,26.8695652 0,22.0144928 L0,13.7246377 C0,8.86956522 2.31884058,6.47826087 6.79710145,6.47826087 L11.2318841,6.47826087 L11.2318841,10.9855072 L7.04347826,10.9855072 C5.5942029,10.9855072 4.84057971,11.8985507 4.84057971,13.9710145 L4.84057971,21.8405797 C4.84057971,23.826087 5.33333333,24.7391304 7.24637681,24.7391304 L11.5942029,24.7391304 L11.5942029,29.1884058 Z" id="Shape"></path>
										<path d="M13.884058,13.2608696 C13.884058,8.62318841 16.6956522,5.88405797 21.2173913,5.88405797 C23.2161725,5.72372739 25.1843541,6.45034843 26.5994517,7.87102822 C28.0145492,9.29170802 28.7334159,11.2627351 28.5652174,13.2608696 L28.5652174,22.5507246 C28.7452381,24.5454125 28.0306542,26.5171152 26.6144644,27.933305 C25.1982746,29.3494948 23.2265719,30.0640787 21.2318841,29.884058 C19.2371962,30.0640787 17.2654935,29.3494948 15.8493037,27.933305 C14.4331139,26.5171152 13.71853,24.5454125 13.8985507,22.5507246 L13.884058,13.2608696 Z M18.5652174,22.6666667 C18.4923645,23.3646461 18.700659,24.0628832 19.1440095,24.6068714 C19.5873599,25.1508597 20.229212,25.4957473 20.9275362,25.5652174 L21.2173913,25.5652174 C21.9625386,25.569833 22.6740913,25.2555714 23.1725782,24.7016972 C23.671065,24.1478229 23.908897,23.4072126 23.826087,22.6666667 L23.826087,13.1449275 C23.9339378,12.4524563 23.7602135,11.7456212 23.3436526,11.1820388 C22.9270916,10.6184563 22.3023346,10.2449932 21.6086957,10.1449275 L21.2173913,10.1449275 C20.4522365,10.138857 19.7217445,10.463552 19.2135597,11.035607 C18.7053749,11.6076621 18.4690233,12.3713265 18.5652174,13.1304348 L18.5652174,22.6666667 Z" id="Shape"></path>
										<path d="M31.0869565,13.0434783 C31.0869565,8.36231884 33.5797101,5.86956522 37.6811594,5.86956522 C38.8453823,5.83452783 39.9812985,6.23209847 40.8695652,6.98550725 L40.8695652,0 L45.7246377,0 L45.7246377,22.6376812 C45.7246377,27.2753623 43.0724638,29.8115942 38.3913043,29.8115942 C33.7101449,29.8115942 31.1449275,27.2898551 31.1449275,22.6376812 L31.0869565,13.0434783 Z M40.8695652,12.9130435 C40.955635,12.2609455 40.777383,11.6015051 40.3745043,11.0815739 C39.9716257,10.5616426 39.3775733,10.224393 38.7246377,10.1449275 L38.3768116,10.1449275 C36.6376812,10.1449275 35.9275362,11.3043478 35.9275362,13.2898551 L35.9275362,22.6521739 C35.9275362,24.6376812 36.884058,25.4782609 38.3768116,25.4782609 C39.8695652,25.4782609 40.8695652,24.6376812 40.8695652,22.6811594 L40.8695652,12.9130435 Z" id="Shape"></path>
										<path d="M61.4637681,29.1884058 L55.0724638,29.1884058 C51.7536232,29.1884058 48.5652174,28.2318841 48.5652174,22.4782609 L48.5652174,13.0434783 C48.5652174,8.36231884 50.9275362,5.79710145 55.5652174,5.79710145 C60.2028986,5.79710145 62.4637681,8.37681159 62.4637681,13.0434783 L62.4637681,15.942029 C62.4637681,21.2463768 59.8115942,21.9130435 56.115942,21.9130435 L53.3478261,21.9130435 L53.3478261,22.5362319 C53.3478261,24.8115942 54.2608696,24.8550725 55.7101449,24.8550725 L61.5072464,24.8550725 L61.4637681,29.1884058 Z M55.3768116,17.826087 C57.0289855,17.826087 57.6086957,17.2463768 57.6086957,15.4637681 L57.6086957,12.8985507 C57.6086957,10.9855072 57.0289855,10.2028986 55.4927536,10.2028986 C53.9565217,10.2028986 53.3478261,10.9855072 53.3478261,13.1014493 L53.3478261,17.884058 L55.3768116,17.826087 Z" id="Shape"></path>
										<path d="M119.797101,22.6376812 C119.797101,27.2753623 117.101449,29.8115942 112.463768,29.8115942 C107.826087,29.8115942 105.217391,27.2898551 105.217391,22.6376812 L105.217391,0 L110.144928,0 L110.144928,7 C111.029645,6.24041394 112.168033,5.84197796 113.333333,5.88405797 C117.434783,5.88405797 119.927536,8.37681159 119.927536,13.1304348 L119.797101,22.6376812 Z M110.014493,22.6376812 C110.014493,24.6231884 110.971014,25.4637681 112.463768,25.4637681 C113.956522,25.4637681 114.956522,24.6376812 114.956522,22.6376812 L114.956522,13.3043478 C114.956522,11.3188406 114.202899,10.1449275 112.463768,10.1449275 C111.752076,10.1383013 111.072698,10.4415761 110.602451,10.9758213 C110.132204,11.5100665 109.9176,12.222439 110.014493,12.9275362 L110.014493,22.6376812 Z" id="Shape"></path>
										<path d="M135.550725,29.1884058 L129.086957,29.1884058 C125.768116,29.1884058 122.57971,28.2318841 122.57971,22.4782609 L122.57971,13.0434783 C122.57971,8.36231884 124.942029,5.79710145 129.57971,5.79710145 C134.217391,5.79710145 136.550725,8.28985507 136.550725,13.0434783 L136.550725,15.942029 C136.550725,21.2463768 133.898551,21.9130435 130.202899,21.9130435 L127.434783,21.9130435 L127.434783,22.5362319 C127.434783,24.8115942 128.347826,24.8550725 129.797101,24.8550725 L135.594203,24.8550725 L135.550725,29.1884058 Z M129.463768,17.826087 C131.115942,17.826087 131.695652,17.2463768 131.695652,15.4637681 L131.695652,12.8985507 C131.695652,10.9855072 131.115942,10.2028986 129.57971,10.2028986 C128.043478,10.2028986 127.434783,10.9855072 127.434783,13.1014493 L127.434783,17.884058 L129.463768,17.826087 Z" id="Shape"></path>
										<path d="M140.695652,6.50724638 L146.492754,6.50724638 C150.724638,6.50724638 152.507246,8.62318841 152.507246,12.7681159 L152.507246,23.7101449 C152.507246,27.942029 149.942029,29.7971014 145.623188,29.7971014 C141.304348,29.7971014 138.826087,27.9275362 138.826087,23.7101449 L138.826087,20.1884058 C138.826087,15.8405797 141.057971,14.3913043 144.913043,14.3913043 L147.811594,14.3913043 L147.811594,12.6811594 C147.811594,11.3478261 147.275362,10.8115942 145.942029,10.8115942 L140.695652,10.8115942 L140.695652,6.50724638 Z M147.826087,23.5797101 L147.826087,18.4492754 L145.463768,18.4492754 C144.951386,18.3806954 144.435705,18.5495973 144.063178,18.9080139 C143.690651,19.2664304 143.501972,19.7752074 143.550725,20.2898551 L143.550725,23.3188406 C143.467176,23.9016615 143.663059,24.4897888 144.079389,24.9061184 C144.495718,25.322448 145.083846,25.5183317 145.666667,25.4347826 C146.826087,25.4927536 147.826087,25.2028986 147.826087,23.5797101 Z" id="Shape"></path>
										<path d="M169.797101,6.50724638 L169.797101,22.5942029 C169.797101,27.4927536 167.188406,29.9275362 162.710145,29.9275362 C158.231884,29.9275362 155.623188,27.4782609 155.623188,22.5942029 L155.623188,6.50724638 L160.391304,6.50724638 L160.391304,22.7536232 C160.391304,24.7391304 161.42029,25.5362319 162.84058,25.5362319 C164.26087,25.5362319 165,24.7536232 165,22.7536232 L165,6.50724638 L169.797101,6.50724638 Z" id="Shape"></path>
										<path d="M172.318841,6.84057971 L174.724638,6.84057971 L174.724638,0 L179.57971,0 L179.57971,6.84057971 L182.478261,6.84057971 L182.478261,11.0724638 L179.57971,11.0724638 L179.57971,21.6376812 C179.57971,24.0434783 180.536232,24.7101449 182.275362,24.7101449 L183.275362,24.7101449 L183.275362,29.1884058 L181.913043,29.1884058 C176.898551,29.1884058 174.73913,27.115942 174.73913,22.0144928 L174.73913,11.0724638 L172.318841,11.0724638 L172.318841,6.84057971 Z" id="Shape"></path>
										<path d="M199.927536,6.55072464 L199.927536,30.3043478 C200.047521,32.0450682 199.401955,33.7514872 198.159832,34.9768996 C196.91771,36.2023119 195.202704,36.8247088 193.463768,36.6811594 L187.376812,36.6811594 L187.376812,32.3333333 L192.753623,32.3333333 C194.492754,32.3333333 195.15942,31.5942029 195.15942,29.9275362 L195.15942,28.1014493 C194.349253,28.5576867 193.436994,28.8019526 192.507246,28.8115942 C188.15942,28.8115942 185.57971,26.4057971 185.57971,21.4782609 L185.57971,6.55072464 L190.347826,6.55072464 L190.347826,21.6376812 C190.347826,23.6231884 191.463768,24.4202899 192.869565,24.4202899 C194.275362,24.4202899 195.101449,23.6376812 195.101449,21.6376812 L195.101449,6.55072464 L199.927536,6.55072464 Z" id="Shape"></path>
									</g>
								</g>
							</svg>
							</li>
						</ul>
					</div>

					<div class="main_menu">
						<ul>
							<li><a href="javascript:orderMenuClick();">주문하기</a></li>
							<li><a href="./faq.jsp">FAQ</a></li>
							<li><a href="./introduce.jsp">회사소개</a></li>
							<li><a href="./cart.jsp">카트</a></li>
							<li><a href="./loginPage.jsp">마이페이지</a></li>
							<div style="clear:both;"></div>
						</ul>
					</div>

					<div>
						<ul>
							<li class="main_title_text">당신만을 위한 헤어케어</li>
						</ul>
					</div>

					<div>
						<ul>
							<li class="main_sub_text">당신의 헤어코드를 분석하여 자체 알고리즘을 통해 당신만을 위한<br>샴푸, 컨디셔너를 주문 즉시 제조하여 배송해 드립니다.</li>
						</ul>
					</div>

					<div>
						<ul>
							<li class="main_title_btn"><a href="javascript:orderMenuClick();" style="color:#fff; padding:16px 35px">
							<!--<li class="main_title_btn"><a href="#" onClick="javascript:window.open('http://codeforbeauty.com/shop/skin/mall_dc/mall_order_info.html','popup','scrollbars=no, resizable=no, width=380,height=670')" style="color:#fff; padding:16px 35px">-->나의 헤어코드 입력</a></li>
						</ul>
					</div>

					<div>
						<ul>
							<li class="main_bottom_text">무료배송! 무료재조합!</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	 </div><!----- Right Begin ----->
<script language=JavaScript>
<!--
function getCookie( name )
{
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
			endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}

		x = document.cookie.indexOf( " ", x ) + 1;

		if ( x == 0 ) break;	
	}
			return "";
}

function setCookie( name, value, expiredays )
    {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function fn_layer_close(idx) {
	if ( document.all.isview.checked ) setCookie( "morning", "done" , 1);
	$("#"+idx).hide();
}
function fn_layer_close2(idx) {
	setCookie( "morning", "done" , 1);
	$("#"+idx).hide();
}



</script>
<STYLE TYPE="text/css">
	.view_layer_hp { display:none; }
	@media screen and (max-width: 768px) { 
		.view_layer_pc { display:none; }
		.view_layer_hp { display:none; } 

		.view_layer_hp img{ width:100%; height:auto; }
	}
</STYLE>


<style>
.con01_item img {width:100%; border-top-left-radius:25px; border-top-right-radius:25px;}
.sham_item {width:100%; padding:60px 10px;}
.1sham_item img {margin:10px 50px;}
.sham_part {width:100%; padding:60px 10px;}
.1sham_part img {margin:10px 30px;}
</style>

<div class="main_middle_con01">
		 <ul>
			<li>
			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center;">
				  <ul>
					 <li class="con01_title_text">머리를 샴푸에 맞추지 말고<br>샴푸를 머리에 맞추세요.</li>					 
				  </ul>
			   </div>

			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center; padding-top:60px;">
				  <ul>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539411639_1.gif'   border='0' name='bner_1'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">수많은 원료를 사용하여 모두에게 다른 처방</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539412038_1.gif'   border='0' name='bner_2'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">천연 유래 성분으로 더욱 건강하게</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539412107_1.gif'   border='0' name='bner_3'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">컴퓨터 개발자와 헤어케어 연구원의 콜라보레이션</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539413781_1.gif'   border='0' name='bner_4'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">세상에 하나뿐인 제품에 당신의 이름을 새겨드려요</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <div style="clear:both;"></div>
				  </ul>
			   </div>
			</li>
		 </ul>
	  </div>



	  <div class="main_middle_con02">
		 <ul>
			<li>
			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center;">
				  <ul>
					 <li class="insta_title"><img src="skin/mall_dc/image/Main/Instagram_logo.png" style="max-width:137px;"></li>
				  </ul>
			   </div>

			   <div style="width:100%; max-width:480px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="float:left; font-size: 40px; font-weight: 900; color: #191919; margin-right:16px;">
					 #맞춤형					 
					 </li>
					 <li style="float:left; font-size: 40px; font-weight: 900; color: #191919; margin-right:16px;">
					 #샴푸					 
					 </li>
					 <li style="float:left; font-size: 40px; font-weight: 900; color: #191919;">
					 #컨디셔너					 
					 </li>
					 <div style="clear:both;"></div>
				  </ul>
			   </div>



			   <link rel="stylesheet" href="../../netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			   <link rel="stylesheet" href="skin/mall_dc/css/bootstrap.min.css">
			   <link href="../../www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">


				<style>
				#mixedSlider {
				  position: relative;
				}
				#mixedSlider .MS-content {
				  white-space: nowrap;
				  overflow: hidden;
				  margin: 0 8%;
				}
				#mixedSlider .MS-content .item {
				  display: inline-block;
				  width: 25%;
				  position: relative;
				  vertical-align: top;
				  white-space: normal;
				  margin-left:5px;
				  margin-right:4px;
				}
				@media (max-width: 991px) {
				  #mixedSlider .MS-content .item {
					width: 50%;
				  }
				}
				@media (max-width: 767px) {
				  #mixedSlider .MS-content .item {
					width: 100%;
				  }
				}
				#mixedSlider .MS-content .item .imgTitle {
				  position: relative;
				}
				#mixedSlider .MS-content .item .imgTitle .blogTitle {
				  margin: 0;
				  text-align: left;
				  letter-spacing: 2px;
				  color: #252525;
				  font-style: italic;
				  position: absolute;
				  background-color: rgba(255, 255, 255, 0.5);
				  width: 100%;
				  bottom: 0;
				  font-weight: bold;
				  padding: 0 0 2px 10px;
				}
				#mixedSlider .MS-content .item .imgTitle img {
				  height: auto;
				  width: 100%;
				}
				#mixedSlider .MS-content .item p {
				  font-size: 16px;
				  margin: 2px 10px 0 5px;
				  text-indent: 15px;
				}
				#mixedSlider .MS-content .item a {
				  float: right;
				  margin: 0 20px 0 0;
				  font-size: 16px;
				  font-style: italic;
				  color: rgba(173, 0, 0, 0.82);
				  font-weight: bold;
				  letter-spacing: 1px;
				  transition: linear 0.1s;
				}
				#mixedSlider .MS-content .item a:hover {
				  text-shadow: 0 0 1px grey;
				}
				#mixedSlider .MS-controls button {
				  position: absolute;
				  border: none;
				  background-color: transparent;
				  outline: 0;
				  font-size: 50px;
				  top: 15px;
				  color: rgba(0, 0, 0, 0.4);
				  transition: 0.15s linear;
				}
				#mixedSlider .MS-controls button:hover {
				  color: rgba(0, 0, 0, 0.8);
				}
				@media (max-width: 992px) {
				  #mixedSlider .MS-controls button {
					font-size: 30px;
				  }
				}
				@media (max-width: 767px) {
				  #mixedSlider .MS-controls button {
					font-size: 20px;
				  }
				}
				#mixedSlider .MS-controls .MS-left {
				  left: 0px;
				}
				@media (max-width: 767px) {
				  #mixedSlider .MS-controls .MS-left {
					left: -10px;
				  }
				}
				#mixedSlider .MS-controls .MS-right {
				  right: 0px;
				}
				@media (max-width: 767px) {
				  #mixedSlider .MS-controls .MS-right {
					right: -10px;
				  }
				}
				#basicSlider { position: relative; }

				#basicSlider .MS-content {
				  white-space: nowrap;
				  overflow: hidden;
				  margin: 0 2%;
				  height: 50px;
				}

				#basicSlider .MS-content .item {
				  display: inline-block;
				  width: 20%;
				  position: relative;
				  vertical-align: top;
				  overflow: hidden;
				  height: 100%;
				  white-space: normal;
				  line-height: 50px;
				  vertical-align: middle;
				}
				@media (max-width: 991px) {

				#basicSlider .MS-content .item { width: 25%; }
				}
				@media (max-width: 767px) {

				#basicSlider .MS-content .item { width: 35%; }
				}
				@media (max-width: 500px) {

				#basicSlider .MS-content .item { width: 50%; }
				}

				#basicSlider .MS-content .item a {
				  line-height: 50px;
				  vertical-align: middle;
				}

				#basicSlider .MS-controls button { position: absolute; }

				#basicSlider .MS-controls .MS-left {
				  top: 35px;
				  left: 10px;
				}

				#basicSlider .MS-controls .MS-right {
				  top: 35px;
				  right: 10px;
				}
				</style>

               
			                  
			   <div style="width:100%; max-width:1196px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="position:relative; margin:69px 0px;">
					     <div style="width:100%; max-width:1100px; margin:0 auto;">

							   <div id="mixedSlider">
									<div class="MS-content">

									    										<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1541122954_1.jpg" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443379_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443364_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443343_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443309_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443291_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443277_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																				<div class="item">
										   <a href="#" target="blank"><img src="board_data/bbs_insta/1535443233_1.png" style="width:220px; height:220px;"></a>
										</div>
										
																			</div>
									<div class="MS-controls">
										 <div class="main_left_arrow"><button class="MS-left"><img src="skin/mall_dc/image/Main/left_arrow.png"></button></div>
										 <div class="main_right_arrow"><button class="MS-right"><img src="skin/mall_dc/image/Main/right_arrow.png"></button></div>
									</div>
							   </div>


						</div>
					 </li>
				  </ul>
			   </div>

			</li>
		 </ul>
	  </div>


	  <script src="../../code.jquery.com/jquery-1.12.4.min.js"></script> 
	  <script src="skin/mall_dc/js/multislider.js"></script> 
	  <script>
		$('#basicSlider').multislider({
					continuous: true,
					duration: 2000
				});
				$('#mixedSlider').multislider({
					duration: 750,
					interval: 3000
				});
	 </script>



	  <div class="main_middle_con03">
		 <ul>
			<li>

			   <div style="margin-top:120px;">
			      <ul>
				     <li style="font-size: 28px; font-weight: 900; color: #191919; text-align:center;">Media</li>					 
				  </ul>
			   </div>

			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center; background:#f8f8fb; border-radius:25px;">
				  <ul>
					 <li>
						<div>
						   <ul>
							  <li style="margin-top:30px; padding:20px 50px;">
								 <div>
									<ul>
									   <li style="width:100%; padding:15px 10px;"><img src="skin/mall_dc/image/Main/bodo_icon01.png" style="margin:10px 50px;"> <img src="skin/mall_dc/image/Main/bodo_icon02.png" style="margin:10px 50px;"> <img src="skin/mall_dc/image/Main/bodo_icon03.png" style="margin:10px 50px;"></li>
									</ul>
								 </div>
							  </li>
						   </ul>
						</div>
					 </li>
				  </ul>
			   </div>
		   

			   <div style="margin-top:120px;">
			      <ul>
				     <li style="font-size: 28px; font-weight: 900; color: #191919; text-align:center;">Partner</li>					 
				  </ul>
			   </div>

			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center; background:#f8f8fb; border-radius:25px;">
				  <ul>
					 <li>
						<div>
						   <ul>
							  <li style="margin-top:30px; padding:20px 20px;">
								  <div>
									<ul>
									   <li class="sham_part"><a href="#"><img src="skin/mall_dc/image/Main/partner_icon01.png" style="margin:10px 30px;"></a><a href="#"><img src="skin/mall_dc/image/Main/partner_icon02.png" style="margin:10px 30px;"></a><a href="#"><img src="skin/mall_dc/image/Main/partner_icon03.png" style="margin:10px 30px;"></a><a href="#"><img src="skin/mall_dc/image/Main/partner_icon04.png" style="margin:10px 30px;"></a></li>
									</ul>
								 </div>
							  </li>
						   </ul>
						</div>
					 </li>
				  </ul>
			   </div>
 	        </li>
		 </ul>
	  </div>

	  <div class="main_middle_con04" style="background:#fff;">
		 <ul>
			<li style="padding:120px 0px;">
			   
			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
					 <li>
						<div>
						   <ul>
							  <li style="font-size: 28px; font-weight: 900; color: #191919;">개발자 X 화학자 X 화장품연구원</li>
							  <li style="font-size: 28px; font-weight: 900; color: #191919;">아름다움을 이해하는 새로운 방식</li>
						   </ul>
						</div>

						<div>
							<ul>
								<li class="m_con03_bottom_title_btn"><a href="javascript:orderMenuClick();" style="color:#fff; padding:16px 46px">
								<!--<li class="m_con03_bottom_title_btn"><a href="#" onClick="javascript:window.open('http://codeforbeauty.com/shop/skin/mall_dc/mall_order_info.html','popup','scrollbars=no, resizable=no, width=380,height=670')" style="color:#fff; padding:16px 46px">-->나의 헤어코드 입력</a></li>
							</ul>
						</div>

						<div>
							<ul>
								<li class="m_con03_bottom_text">코드포뷰티의 제품이 고객님과 맞지 않을 시<br>새로운 레시피로 재조합해드립니다.</li>
							</ul>
						</div>

					 </li>
				  </ul>
			   </div>

			</li>
		 </ul>
	  </div>

</div>


<!-- 모바일 -->





<div id="mobile" style="min-width:360px;">
<div style="background-image:url('skin/mall_dc/image/Main/m_main_visual.png'); height:447px; background-repeat: no-repeat; background-position: center;">

   <!-- <div style="background-size: cover; background-position: 50% 50%; background-repeat: no-repeat; background: transparent; z-index: -100; position: fixed; top: 0px; left: 0px; overflow: hidden; transform: translate3d(0px, 0px, 0px); visibility: visible; width:100%; height:100%; background: url(./skin/mall_dc/image/Main/m_main_visual.png) 50% 0 no-repeat fixed;"></div> -->

			
		 <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				<ul>
					<li>
                        <!-- 모바일 삼선메뉴 -->
						<div>
							<ul>
								<li class="m_logo">
									<svg width="140px" height="27px" viewBox="0 0 140 27" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
									<!-- Generator: Sketch 48.2 (47327) - http://www.bohemiancoding.com/sketch -->
									<title>CFB Logo bk</title>
									<desc>Created with Sketch.</desc>
									<defs></defs>
									<g id="Main-Copy-3" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-20.000000, -87.000000)">
										<g id="CFB-Logo-bk" transform="translate(20.000000, 87.811594)" fill="#191919" fill-rule="nonzero">
											<path d="M49.4057971,4.55507246 L50.4913043,4.55507246 L50.4913043,4.4942029 C50.4913043,1.8057971 51.7492754,1.14637681 53.9405797,1.14637681 L54.5188406,1.14637681 L54.5188406,3.17536232 L54.0014493,3.17536232 C53.1594203,3.17536232 52.8550725,3.5 52.8550725,4.55507246 L54.1130435,4.55507246 L54.1130435,6.58405797 L52.8550725,6.58405797 L52.8550725,15.3391304 L50.4913043,15.3391304 L50.4913043,6.60434783 L49.4057971,6.60434783 L49.4057971,4.55507246 Z" id="Shape"></path>
											<path d="M55.0565217,7.65942029 C55.0565217,5.69840922 56.6462353,4.10869565 58.6072464,4.10869565 C60.5682574,4.10869565 62.157971,5.69840922 62.157971,7.65942029 L62.157971,12.173913 C62.2427139,13.1364223 61.8970041,14.0870666 61.2137745,14.7702962 C60.5305448,15.4535258 59.5799006,15.7992356 58.6173913,15.7144928 C57.6515312,15.8056541 56.6951213,15.4627908 56.0071626,14.7787521 C55.3192039,14.0947134 54.970881,13.1402783 55.0565217,12.173913 L55.0565217,7.65942029 Z M57.3188406,12.173913 C57.2353574,12.8685147 57.7301651,13.499508 58.4246377,13.584058 L58.5971014,13.584058 C58.9588565,13.5867158 59.3042456,13.4335041 59.5450709,13.1635467 C59.7858962,12.8935894 59.8988441,12.53302 59.8550725,12.173913 L59.8550725,7.59855072 C59.9012578,7.26484385 59.8127601,6.92647429 59.609108,6.65811035 C59.4054559,6.38974642 59.1033892,6.21344689 58.7695652,6.16811594 L58.5971014,6.16811594 C58.2299944,6.1655041 57.8794853,6.32085707 57.6348643,6.59459964 C57.3902432,6.8683422 57.275127,7.23404619 57.3188406,7.59855072 L57.3188406,12.173913 Z" id="Shape"></path>
											<path d="M67.9710145,6.34057971 L67.0478261,6.34057971 C66.2057971,6.34057971 65.9217391,6.68550725 65.9217391,7.80144928 L65.9217391,15.3492754 L63.6086957,15.3492754 L63.6086957,7.65942029 C63.6086957,5.1942029 64.3695652,4.23043478 66.7942029,4.23043478 L67.9710145,4.23043478 L67.9710145,6.34057971 Z" id="Shape"></path>
											<polygon id="Shape" points="67.9710145 20.4318841 49.4057971 20.4318841 49.4057971 18.0681159 67.9710145 18.0681159"></polygon>
											<path d="M8.11594203,20.4318841 L4.75797101,20.4318841 C1.62318841,20.4318841 0,18.8086957 0,15.4101449 L0,9.60724638 C0,6.20869565 1.62318841,4.53478261 4.75797101,4.53478261 L7.86231884,4.53478261 L7.86231884,7.68985507 L4.93043478,7.68985507 C3.91594203,7.68985507 3.3884058,8.32898551 3.3884058,9.77971014 L3.3884058,15.2884058 C3.3884058,16.6782609 3.73333333,17.3173913 5.07246377,17.3173913 L8.11594203,17.3173913 L8.11594203,20.4318841 Z" id="Shape"></path>
											<path d="M9.71884058,9.2826087 C9.71884058,6.03623188 11.6869565,4.11884058 14.8521739,4.11884058 C16.2513207,4.00660917 17.6290479,4.5152439 18.6196162,5.50971976 C19.6101845,6.50419561 20.1133911,7.88391456 19.9956522,9.2826087 L19.9956522,15.7855072 C20.1216667,17.1817887 19.621458,18.5619807 18.6301251,19.5533135 C17.6387923,20.5446464 16.2586003,21.0448551 14.8623188,20.9188406 C13.4660373,21.0448551 12.0858454,20.5446464 11.0945126,19.5533135 C10.1031797,18.5619807 9.60297103,17.1817887 9.72898551,15.7855072 L9.71884058,9.2826087 Z M12.9956522,15.8666667 C12.9446551,16.3552523 13.0904613,16.8440182 13.4008066,17.22481 C13.7111519,17.6056018 14.1604484,17.8470231 14.6492754,17.8956522 L14.8521739,17.8956522 C15.373777,17.8988831 15.8718639,17.6789 16.2208047,17.291188 C16.5697455,16.903476 16.7362279,16.3850488 16.6782609,15.8666667 L16.6782609,9.20144928 C16.7537565,8.71671943 16.6321494,8.22193486 16.3405568,7.82742715 C16.0489641,7.43291944 15.6116343,7.17149523 15.126087,7.10144928 L14.8521739,7.10144928 C14.3165656,7.09719987 13.8052212,7.32448643 13.4494918,7.72492493 C13.0937625,8.12536344 12.9283163,8.65992854 12.9956522,9.19130435 L12.9956522,15.8666667 Z" id="Shape"></path>
											<path d="M21.7608696,9.13043478 C21.7608696,5.85362319 23.5057971,4.10869565 26.3768116,4.10869565 C27.1917676,4.08416948 27.9869089,4.36246893 28.6086957,4.88985507 L28.6086957,0 L32.0072464,0 L32.0072464,15.8463768 C32.0072464,19.0927536 30.1507246,20.8681159 26.873913,20.8681159 C23.5971014,20.8681159 21.8014493,19.1028986 21.8014493,15.8463768 L21.7608696,9.13043478 Z M28.6086957,9.03913043 C28.6689445,8.58266188 28.5441681,8.12105357 28.262153,7.7571017 C27.980138,7.39314983 27.5643013,7.15707508 27.1072464,7.10144928 L26.8637681,7.10144928 C25.6463768,7.10144928 25.1492754,7.91304348 25.1492754,9.30289855 L25.1492754,15.8565217 C25.1492754,17.2463768 25.8188406,17.8347826 26.8637681,17.8347826 C27.9086957,17.8347826 28.6086957,17.2463768 28.6086957,15.8768116 L28.6086957,9.03913043 Z" id="Shape"></path>
											<path d="M43.0246377,20.4318841 L38.5507246,20.4318841 C36.2275362,20.4318841 33.9956522,19.7623188 33.9956522,15.7347826 L33.9956522,9.13043478 C33.9956522,5.85362319 35.6492754,4.05797101 38.8956522,4.05797101 C42.142029,4.05797101 43.7246377,5.86376812 43.7246377,9.13043478 L43.7246377,11.1594203 C43.7246377,14.8724638 41.8681159,15.3391304 39.2811594,15.3391304 L37.3434783,15.3391304 L37.3434783,15.7753623 C37.3434783,17.3681159 37.9826087,17.3985507 38.9971014,17.3985507 L43.0550725,17.3985507 L43.0246377,20.4318841 Z M38.7637681,12.4782609 C39.9202899,12.4782609 40.326087,12.0724638 40.326087,10.8246377 L40.326087,9.02898551 C40.326087,7.68985507 39.9202899,7.14202899 38.8449275,7.14202899 C37.7695652,7.14202899 37.3434783,7.68985507 37.3434783,9.17101449 L37.3434783,12.5188406 L38.7637681,12.4782609 Z" id="Shape"></path>
											<path d="M83.857971,15.8463768 C83.857971,19.0927536 81.9710145,20.8681159 78.7246377,20.8681159 C75.4782609,20.8681159 73.6521739,19.1028986 73.6521739,15.8463768 L73.6521739,0 L77.1014493,0 L77.1014493,4.9 C77.7207512,4.36828976 78.5176232,4.08938457 79.3333333,4.11884058 C82.2043478,4.11884058 83.9492754,5.86376812 83.9492754,9.19130435 L83.857971,15.8463768 Z M77.0101449,15.8463768 C77.0101449,17.2362319 77.6797101,17.8246377 78.7246377,17.8246377 C79.7695652,17.8246377 80.4695652,17.2463768 80.4695652,15.8463768 L80.4695652,9.31304348 C80.4695652,7.92318841 79.942029,7.10144928 78.7246377,7.10144928 C78.2264529,7.09681091 77.7508886,7.30910325 77.4217156,7.68307489 C77.0925427,8.05704652 76.9423201,8.55570733 77.0101449,9.04927536 L77.0101449,15.8463768 Z" id="Shape"></path>
											<path d="M94.8855072,20.4318841 L90.3608696,20.4318841 C88.0376812,20.4318841 85.8057971,19.7623188 85.8057971,15.7347826 L85.8057971,9.13043478 C85.8057971,5.85362319 87.4594203,4.05797101 90.7057971,4.05797101 C93.9521739,4.05797101 95.5855072,5.80289855 95.5855072,9.13043478 L95.5855072,11.1594203 C95.5855072,14.8724638 93.7289855,15.3391304 91.142029,15.3391304 L89.2043478,15.3391304 L89.2043478,15.7753623 C89.2043478,17.3681159 89.8434783,17.3985507 90.857971,17.3985507 L94.915942,17.3985507 L94.8855072,20.4318841 Z M90.6246377,12.4782609 C91.7811594,12.4782609 92.1869565,12.0724638 92.1869565,10.8246377 L92.1869565,9.02898551 C92.1869565,7.68985507 91.7811594,7.14202899 90.7057971,7.14202899 C89.6304348,7.14202899 89.2043478,7.68985507 89.2043478,9.17101449 L89.2043478,12.5188406 L90.6246377,12.4782609 Z" id="Shape"></path>
											<path d="M98.4869565,4.55507246 L102.544928,4.55507246 C105.507246,4.55507246 106.755072,6.03623188 106.755072,8.93768116 L106.755072,16.5971014 C106.755072,19.5594203 104.95942,20.857971 101.936232,20.857971 C98.9130435,20.857971 97.1782609,19.5492754 97.1782609,16.5971014 L97.1782609,14.1318841 C97.1782609,11.0884058 98.7405797,10.073913 101.43913,10.073913 L103.468116,10.073913 L103.468116,8.87681159 C103.468116,7.94347826 103.092754,7.56811594 102.15942,7.56811594 L98.4869565,7.56811594 L98.4869565,4.55507246 Z M103.478261,16.5057971 L103.478261,12.9144928 L101.824638,12.9144928 C101.46597,12.8664868 101.104994,12.9847181 100.844225,13.2356097 C100.583455,13.4865013 100.45138,13.8426452 100.485507,14.2028986 L100.485507,16.3231884 C100.427023,16.731163 100.564141,17.1428522 100.855572,17.4342829 C101.147003,17.7257136 101.558692,17.8628322 101.966667,17.8043478 C102.778261,17.8449275 103.478261,17.642029 103.478261,16.5057971 Z" id="Shape"></path>
											<path d="M118.857971,4.55507246 L118.857971,15.815942 C118.857971,19.2449275 117.031884,20.9492754 113.897101,20.9492754 C110.762319,20.9492754 108.936232,19.2347826 108.936232,15.815942 L108.936232,4.55507246 L112.273913,4.55507246 L112.273913,15.9275362 C112.273913,17.3173913 112.994203,17.8753623 113.988406,17.8753623 C114.982609,17.8753623 115.5,17.3275362 115.5,15.9275362 L115.5,4.55507246 L118.857971,4.55507246 Z" id="Shape"></path>
											<path d="M120.623188,4.7884058 L122.307246,4.7884058 L122.307246,0 L125.705797,0 L125.705797,4.7884058 L127.734783,4.7884058 L127.734783,7.75072464 L125.705797,7.75072464 L125.705797,15.1463768 C125.705797,16.8304348 126.375362,17.2971014 127.592754,17.2971014 L128.292754,17.2971014 L128.292754,20.4318841 L127.33913,20.4318841 C123.828986,20.4318841 122.317391,18.9811594 122.317391,15.4101449 L122.317391,7.75072464 L120.623188,7.75072464 L120.623188,4.7884058 Z" id="Shape"></path>
											<path d="M139.949275,4.58550725 L139.949275,21.2130435 C140.033265,22.4315477 139.581368,23.6260411 138.711882,24.4838297 C137.842397,25.3416183 136.641893,25.7772961 135.424638,25.6768116 L131.163768,25.6768116 L131.163768,22.6333333 L134.927536,22.6333333 C136.144928,22.6333333 136.611594,22.115942 136.611594,20.9492754 L136.611594,19.6710145 C136.044477,19.9903807 135.405896,20.1613668 134.755072,20.1681159 C131.711594,20.1681159 129.905797,18.484058 129.905797,15.0347826 L129.905797,4.58550725 L133.243478,4.58550725 L133.243478,15.1463768 C133.243478,16.5362319 134.024638,17.0942029 135.008696,17.0942029 C135.992754,17.0942029 136.571014,16.5463768 136.571014,15.1463768 L136.571014,4.58550725 L139.949275,4.58550725 Z" id="Shape"></path>
										</g>
									</g>
								</svg>
								</li>
								<li class="m_menu">
									<div class="nav">
										<div class="main-nav">
											<a class="hamburger-nav"><img src="skin/mall_dc/image/Main/m_menu.png"></a>
										</div>
									 </div>
								</li>
								<div style="clear:both;"></div>
								<div class="menu" style="display:none; text-align:center; position:absolute; width:100%; margin:0 auto; z-index:100; background:#e0e0e2; margin-top:-62px;">
								    <div>
										<ul>
											<li class="m_logo"><a href="index-2.html">
												<svg width="140px" height="27px" viewBox="0 0 140 27" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
									<!-- Generator: Sketch 48.2 (47327) - http://www.bohemiancoding.com/sketch -->
									<title>CFB Logo bk</title>
									<desc>Created with Sketch.</desc>
									<defs></defs>
									<g id="Main-Copy-3" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-20.000000, -87.000000)">
										<g id="CFB-Logo-bk" transform="translate(20.000000, 87.811594)" fill="#191919" fill-rule="nonzero">
											<path d="M49.4057971,4.55507246 L50.4913043,4.55507246 L50.4913043,4.4942029 C50.4913043,1.8057971 51.7492754,1.14637681 53.9405797,1.14637681 L54.5188406,1.14637681 L54.5188406,3.17536232 L54.0014493,3.17536232 C53.1594203,3.17536232 52.8550725,3.5 52.8550725,4.55507246 L54.1130435,4.55507246 L54.1130435,6.58405797 L52.8550725,6.58405797 L52.8550725,15.3391304 L50.4913043,15.3391304 L50.4913043,6.60434783 L49.4057971,6.60434783 L49.4057971,4.55507246 Z" id="Shape"></path>
											<path d="M55.0565217,7.65942029 C55.0565217,5.69840922 56.6462353,4.10869565 58.6072464,4.10869565 C60.5682574,4.10869565 62.157971,5.69840922 62.157971,7.65942029 L62.157971,12.173913 C62.2427139,13.1364223 61.8970041,14.0870666 61.2137745,14.7702962 C60.5305448,15.4535258 59.5799006,15.7992356 58.6173913,15.7144928 C57.6515312,15.8056541 56.6951213,15.4627908 56.0071626,14.7787521 C55.3192039,14.0947134 54.970881,13.1402783 55.0565217,12.173913 L55.0565217,7.65942029 Z M57.3188406,12.173913 C57.2353574,12.8685147 57.7301651,13.499508 58.4246377,13.584058 L58.5971014,13.584058 C58.9588565,13.5867158 59.3042456,13.4335041 59.5450709,13.1635467 C59.7858962,12.8935894 59.8988441,12.53302 59.8550725,12.173913 L59.8550725,7.59855072 C59.9012578,7.26484385 59.8127601,6.92647429 59.609108,6.65811035 C59.4054559,6.38974642 59.1033892,6.21344689 58.7695652,6.16811594 L58.5971014,6.16811594 C58.2299944,6.1655041 57.8794853,6.32085707 57.6348643,6.59459964 C57.3902432,6.8683422 57.275127,7.23404619 57.3188406,7.59855072 L57.3188406,12.173913 Z" id="Shape"></path>
											<path d="M67.9710145,6.34057971 L67.0478261,6.34057971 C66.2057971,6.34057971 65.9217391,6.68550725 65.9217391,7.80144928 L65.9217391,15.3492754 L63.6086957,15.3492754 L63.6086957,7.65942029 C63.6086957,5.1942029 64.3695652,4.23043478 66.7942029,4.23043478 L67.9710145,4.23043478 L67.9710145,6.34057971 Z" id="Shape"></path>
											<polygon id="Shape" points="67.9710145 20.4318841 49.4057971 20.4318841 49.4057971 18.0681159 67.9710145 18.0681159"></polygon>
											<path d="M8.11594203,20.4318841 L4.75797101,20.4318841 C1.62318841,20.4318841 0,18.8086957 0,15.4101449 L0,9.60724638 C0,6.20869565 1.62318841,4.53478261 4.75797101,4.53478261 L7.86231884,4.53478261 L7.86231884,7.68985507 L4.93043478,7.68985507 C3.91594203,7.68985507 3.3884058,8.32898551 3.3884058,9.77971014 L3.3884058,15.2884058 C3.3884058,16.6782609 3.73333333,17.3173913 5.07246377,17.3173913 L8.11594203,17.3173913 L8.11594203,20.4318841 Z" id="Shape"></path>
											<path d="M9.71884058,9.2826087 C9.71884058,6.03623188 11.6869565,4.11884058 14.8521739,4.11884058 C16.2513207,4.00660917 17.6290479,4.5152439 18.6196162,5.50971976 C19.6101845,6.50419561 20.1133911,7.88391456 19.9956522,9.2826087 L19.9956522,15.7855072 C20.1216667,17.1817887 19.621458,18.5619807 18.6301251,19.5533135 C17.6387923,20.5446464 16.2586003,21.0448551 14.8623188,20.9188406 C13.4660373,21.0448551 12.0858454,20.5446464 11.0945126,19.5533135 C10.1031797,18.5619807 9.60297103,17.1817887 9.72898551,15.7855072 L9.71884058,9.2826087 Z M12.9956522,15.8666667 C12.9446551,16.3552523 13.0904613,16.8440182 13.4008066,17.22481 C13.7111519,17.6056018 14.1604484,17.8470231 14.6492754,17.8956522 L14.8521739,17.8956522 C15.373777,17.8988831 15.8718639,17.6789 16.2208047,17.291188 C16.5697455,16.903476 16.7362279,16.3850488 16.6782609,15.8666667 L16.6782609,9.20144928 C16.7537565,8.71671943 16.6321494,8.22193486 16.3405568,7.82742715 C16.0489641,7.43291944 15.6116343,7.17149523 15.126087,7.10144928 L14.8521739,7.10144928 C14.3165656,7.09719987 13.8052212,7.32448643 13.4494918,7.72492493 C13.0937625,8.12536344 12.9283163,8.65992854 12.9956522,9.19130435 L12.9956522,15.8666667 Z" id="Shape"></path>
											<path d="M21.7608696,9.13043478 C21.7608696,5.85362319 23.5057971,4.10869565 26.3768116,4.10869565 C27.1917676,4.08416948 27.9869089,4.36246893 28.6086957,4.88985507 L28.6086957,0 L32.0072464,0 L32.0072464,15.8463768 C32.0072464,19.0927536 30.1507246,20.8681159 26.873913,20.8681159 C23.5971014,20.8681159 21.8014493,19.1028986 21.8014493,15.8463768 L21.7608696,9.13043478 Z M28.6086957,9.03913043 C28.6689445,8.58266188 28.5441681,8.12105357 28.262153,7.7571017 C27.980138,7.39314983 27.5643013,7.15707508 27.1072464,7.10144928 L26.8637681,7.10144928 C25.6463768,7.10144928 25.1492754,7.91304348 25.1492754,9.30289855 L25.1492754,15.8565217 C25.1492754,17.2463768 25.8188406,17.8347826 26.8637681,17.8347826 C27.9086957,17.8347826 28.6086957,17.2463768 28.6086957,15.8768116 L28.6086957,9.03913043 Z" id="Shape"></path>
											<path d="M43.0246377,20.4318841 L38.5507246,20.4318841 C36.2275362,20.4318841 33.9956522,19.7623188 33.9956522,15.7347826 L33.9956522,9.13043478 C33.9956522,5.85362319 35.6492754,4.05797101 38.8956522,4.05797101 C42.142029,4.05797101 43.7246377,5.86376812 43.7246377,9.13043478 L43.7246377,11.1594203 C43.7246377,14.8724638 41.8681159,15.3391304 39.2811594,15.3391304 L37.3434783,15.3391304 L37.3434783,15.7753623 C37.3434783,17.3681159 37.9826087,17.3985507 38.9971014,17.3985507 L43.0550725,17.3985507 L43.0246377,20.4318841 Z M38.7637681,12.4782609 C39.9202899,12.4782609 40.326087,12.0724638 40.326087,10.8246377 L40.326087,9.02898551 C40.326087,7.68985507 39.9202899,7.14202899 38.8449275,7.14202899 C37.7695652,7.14202899 37.3434783,7.68985507 37.3434783,9.17101449 L37.3434783,12.5188406 L38.7637681,12.4782609 Z" id="Shape"></path>
											<path d="M83.857971,15.8463768 C83.857971,19.0927536 81.9710145,20.8681159 78.7246377,20.8681159 C75.4782609,20.8681159 73.6521739,19.1028986 73.6521739,15.8463768 L73.6521739,0 L77.1014493,0 L77.1014493,4.9 C77.7207512,4.36828976 78.5176232,4.08938457 79.3333333,4.11884058 C82.2043478,4.11884058 83.9492754,5.86376812 83.9492754,9.19130435 L83.857971,15.8463768 Z M77.0101449,15.8463768 C77.0101449,17.2362319 77.6797101,17.8246377 78.7246377,17.8246377 C79.7695652,17.8246377 80.4695652,17.2463768 80.4695652,15.8463768 L80.4695652,9.31304348 C80.4695652,7.92318841 79.942029,7.10144928 78.7246377,7.10144928 C78.2264529,7.09681091 77.7508886,7.30910325 77.4217156,7.68307489 C77.0925427,8.05704652 76.9423201,8.55570733 77.0101449,9.04927536 L77.0101449,15.8463768 Z" id="Shape"></path>
											<path d="M94.8855072,20.4318841 L90.3608696,20.4318841 C88.0376812,20.4318841 85.8057971,19.7623188 85.8057971,15.7347826 L85.8057971,9.13043478 C85.8057971,5.85362319 87.4594203,4.05797101 90.7057971,4.05797101 C93.9521739,4.05797101 95.5855072,5.80289855 95.5855072,9.13043478 L95.5855072,11.1594203 C95.5855072,14.8724638 93.7289855,15.3391304 91.142029,15.3391304 L89.2043478,15.3391304 L89.2043478,15.7753623 C89.2043478,17.3681159 89.8434783,17.3985507 90.857971,17.3985507 L94.915942,17.3985507 L94.8855072,20.4318841 Z M90.6246377,12.4782609 C91.7811594,12.4782609 92.1869565,12.0724638 92.1869565,10.8246377 L92.1869565,9.02898551 C92.1869565,7.68985507 91.7811594,7.14202899 90.7057971,7.14202899 C89.6304348,7.14202899 89.2043478,7.68985507 89.2043478,9.17101449 L89.2043478,12.5188406 L90.6246377,12.4782609 Z" id="Shape"></path>
											<path d="M98.4869565,4.55507246 L102.544928,4.55507246 C105.507246,4.55507246 106.755072,6.03623188 106.755072,8.93768116 L106.755072,16.5971014 C106.755072,19.5594203 104.95942,20.857971 101.936232,20.857971 C98.9130435,20.857971 97.1782609,19.5492754 97.1782609,16.5971014 L97.1782609,14.1318841 C97.1782609,11.0884058 98.7405797,10.073913 101.43913,10.073913 L103.468116,10.073913 L103.468116,8.87681159 C103.468116,7.94347826 103.092754,7.56811594 102.15942,7.56811594 L98.4869565,7.56811594 L98.4869565,4.55507246 Z M103.478261,16.5057971 L103.478261,12.9144928 L101.824638,12.9144928 C101.46597,12.8664868 101.104994,12.9847181 100.844225,13.2356097 C100.583455,13.4865013 100.45138,13.8426452 100.485507,14.2028986 L100.485507,16.3231884 C100.427023,16.731163 100.564141,17.1428522 100.855572,17.4342829 C101.147003,17.7257136 101.558692,17.8628322 101.966667,17.8043478 C102.778261,17.8449275 103.478261,17.642029 103.478261,16.5057971 Z" id="Shape"></path>
											<path d="M118.857971,4.55507246 L118.857971,15.815942 C118.857971,19.2449275 117.031884,20.9492754 113.897101,20.9492754 C110.762319,20.9492754 108.936232,19.2347826 108.936232,15.815942 L108.936232,4.55507246 L112.273913,4.55507246 L112.273913,15.9275362 C112.273913,17.3173913 112.994203,17.8753623 113.988406,17.8753623 C114.982609,17.8753623 115.5,17.3275362 115.5,15.9275362 L115.5,4.55507246 L118.857971,4.55507246 Z" id="Shape"></path>
											<path d="M120.623188,4.7884058 L122.307246,4.7884058 L122.307246,0 L125.705797,0 L125.705797,4.7884058 L127.734783,4.7884058 L127.734783,7.75072464 L125.705797,7.75072464 L125.705797,15.1463768 C125.705797,16.8304348 126.375362,17.2971014 127.592754,17.2971014 L128.292754,17.2971014 L128.292754,20.4318841 L127.33913,20.4318841 C123.828986,20.4318841 122.317391,18.9811594 122.317391,15.4101449 L122.317391,7.75072464 L120.623188,7.75072464 L120.623188,4.7884058 Z" id="Shape"></path>
											<path d="M139.949275,4.58550725 L139.949275,21.2130435 C140.033265,22.4315477 139.581368,23.6260411 138.711882,24.4838297 C137.842397,25.3416183 136.641893,25.7772961 135.424638,25.6768116 L131.163768,25.6768116 L131.163768,22.6333333 L134.927536,22.6333333 C136.144928,22.6333333 136.611594,22.115942 136.611594,20.9492754 L136.611594,19.6710145 C136.044477,19.9903807 135.405896,20.1613668 134.755072,20.1681159 C131.711594,20.1681159 129.905797,18.484058 129.905797,15.0347826 L129.905797,4.58550725 L133.243478,4.58550725 L133.243478,15.1463768 C133.243478,16.5362319 134.024638,17.0942029 135.008696,17.0942029 C135.992754,17.0942029 136.571014,16.5463768 136.571014,15.1463768 L136.571014,4.58550725 L139.949275,4.58550725 Z" id="Shape"></path>
										</g>
									</g>
								</svg>
											</a></li>
											<li class="m_menu">
												<div class="nav">
													<div class="main-nav">
														<a class="hamburger-nav" style="cursor:pointer"><img src="skin/mall_dc/image/Main/mobile_close.png"></a>
													</div>
												 </div>
											</li>
										</ul>
									</div>
								    <div style="text-align:center; padding-top:80px;">
										<a href="index-2.html" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">홈</a>
										<div class="menu_line"></div>
									</div>
									<div style="text-align:center; margin-top:10px;">
										<!--<a href="#" onClick="javascript:window.open('http://codeforbeauty.com/shop/skin/mall_dc/mall_order_info.html','popup','scrollbars=no, resizable=no, width=380,height=670')" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">-->
										<a href="m_mall_detailb8bc.html?ps_ctid=01000000&amp;ps_goid=1" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">주문하기</a>
										<div class="menu_line"></div>
									</div>
									<!-- <div style="text-align:center; margin-top:10px;">
										<a href="m_gift.php" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">선물하기</a>
										<div class="menu_line"></div>
									</div> -->
									<!-- <div style="text-align:center; margin-top:10px;">
										<a href="m_board.php?ps_db=bbs_review" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">리뷰</a>
										<div class="menu_line"></div>
									</div> -->
									<div style="text-align:center; margin-top:10px;">
										<a href="m_board78d3.html?ps_db=bbs_faq" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">FAQ</a>
										<div class="menu_line"></div>
									</div>
									<div style="text-align:center; margin-top:10px;">
										<a href="m_page5ee4.html?ps_pname=page_about" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">회사소개</a>
										<div class="menu_line"></div>
									</div>


																		<div style="text-align:center; margin-top:10px;">
										<div style="position:relative;">
									    										<a href="m_cart.html" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">
											카트
										</a>
										</div>
										<div class="menu_line"></div>
									</div>
									<div style="text-align:center; margin-top:10px;">
										<a href="m_mypage.html" style="font-size:22px; color:#191919; font-weight:900; padding:0px 20px; z-index:999px; background:#e0e0e2;">마이페이지</a>
										<div class="menu_line"></div>
									</div>
									<div style="text-align:center; margin-top:60px; margin-bottom:20px;">
										<li class="language_m"><a href="#"><span><img src="skin/mall_dc/image/Main/language_icon.png"></span> Korea ▼</a></li>
									</div>
								</div>

								<script src="../../code.jquery.com/jquery-1.12.4.min.js"></script>
						        <script src="skin/mall_dc/js/app.js"></script>

							</ul>
						</div>


						<div>
							<ul>
								<li class="m_main_title_text">당신만을 위한<br>맞춤형 헤어케어</li>								
							</ul>
						</div>

						<div>
							<ul>
								<li class="m_main_sub_text">당신의 헤어코드를 분석하여 자체 알고리즘을<br>통해 당신만을 위한 샴푸, 컨디셔너를 주문 즉시<br>제조하여 배송해 드립니다.</li>
							</ul>
						</div>

						<div>
							<ul>
								<li class="m_main_title_btn"><a href="javascript:orderMenuClick();" style="color:#fff; padding:16px 35px">
								<!--<li class="m_main_title_btn"><a href="#" onClick="javascript:window.open('http://codeforbeauty.com/shop/skin/mall_dc/mall_order_info.html','popup','scrollbars=no, resizable=no, width=380,height=670')" style="color:#fff; padding:16px 35px">-->나의 헤어코드 입력</a></li>
							</ul>
						</div>

					</li>

				</ul>
			</div>
	 </div>



	  <div class="m_main_middle_con01" style="padding-top:50px; background:#fff;">
		 <ul>
			<li style="margin:0px 30px;">
			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center;">
				  <ul>
					 <li class="m_con01_title_text">머리를 샴푸에 맞추지 말고<br>샴푸를 머리에 맞추세요.</li>					 
				  </ul>
			   </div>

			   <div style="width:100%; max-width:940px; margin:0 auto; text-align:center; padding-top:60px;">
				  <ul>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539411639_1.gif'   border='0' name='bner_1'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">수많은 원료를 사용하여 모두에게 다른 처방</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539412038_1.gif'   border='0' name='bner_2'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">천연 유래 성분으로 더욱 건강하게</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <div style="clear:both;"></div>
				  </ul>

				  <ul>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539412107_1.gif'   border='0' name='bner_3'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:50px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">컴퓨터 개발자와 헤어케어 연구원의 콜라보레이션</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <li class="con01_item">
						<div>
							<ul>
								<li><img src='board_data/1539413781_1.gif'   border='0' name='bner_4'>
</li>
								<li style="height:94px; background:#f8f8fb; border-bottom-left-radius:25px; border-bottom-right-radius:25px;">
								   <div style="padding:20px 24px; text-align:left;">
									  <ul>
										 <li style="font-size: 18px; font-weight: 900; color: #191919;">세상에 하나뿐인 제품에 당신의 이름을 새겨드려요</li>
									  </ul>
								   </div>
								</li>
							</ul>
						</div>
					 </li>
					 <div style="clear:both;"></div>
				  </ul>
			   </div>
			</li>
		 </ul>
	  </div>


	  <div class="m_main_middle_con02" style="margin-top:-4%;">
		 <ul>
			<li style="margin:0px 30px;">

			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
					 <li class="m_insta_title"><img src="skin/mall_dc/image/Main/Instagram_logo.png" style="max-width:137px;"></li>
				  </ul>
			   </div>

			   <div style="width:100%; max-width:320px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="float:left; font-size: 28px; font-weight: 900; color: #191919; margin-right:10px;">
					 #맞춤형					 
					 </li>
					 <li style="float:left; font-size: 28px; font-weight: 900; color: #191919; margin-right:10px;">
					 #샴푸					 
					 </li>
					 <li style="float:left; font-size: 28px; font-weight: 900; color: #191919;">
					 #컨디셔너					 
					 </li>
					 <div style="clear:both;"></div>
				  </ul>
			   </div>

			   <link rel="stylesheet" href="skin/mall_dc/dist/css/swiper.min.css">

            
               			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
				     <li class="insta_item" style="margin-top:20px;">
					    <div class="swiper-container">
							<div class="swiper-wrapper">

						      							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1541122954_1.jpg" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443379_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443364_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443343_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443309_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443291_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443277_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  							     <div class="swiper-slide"><a href="#" target="blank"><img src="board_data/bbs_insta/1535443233_1.png" style="width:100%; 1max-width:315px;"></a></div>

							  						   </div>
						</div>
					 </li>
					 <div style="clear:both;"></div>

				  </ul>
			   </div>



			   <!-- Swiper JS -->
				<script src="skin/mall_dc/dist/js/swiper.min.js"></script>

				<script>
				var swiper = new Swiper('.swiper-container', {
					pagination: '.swiper-pagination',
					nextButton: '.swiper-button-next',
					prevButton: '.swiper-button-prev',
					paginationClickable: true,
					spaceBetween: 30,
					centeredSlides: true,
					autoplay: 2500,
					autoplayDisableOnInteraction: false
				});
				</script>

			</li>
		 </ul>
	  </div>


	  <div class="m_main_middle_con03">
		 <ul>
			<li>

			   <div style="padding-top:80px;">
			      <ul>
				     <li style="font-size: 28px; font-weight: 900; color: #191919; text-align:center;">Media</li>					 
				  </ul>
			   </div>

			   <div style="margin-top:50px;"></div>

			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="margin:0px 30px;">
						<div style="background:#f8f8fb; border-radius:25px;">
						   <ul>
							  <li 1style="padding:20px 20px;">
								  <div class="sham_item">
									<ul>
									   <li><img src='board_data/1539594791_1.png'   border='0' name='bner_5'>
</li>
									   <li style="margin-top:50px;"><img src='board_data/1539594747_1.png'   border='0' name='bner_6'>
</li>
									   <li style="margin-top:50px;"><img src='board_data/1539594849_1.png'   border='0' name='bner_7'>
</li>
									</ul>
								 </div>
							  </li>
						   </ul>
						</div>
					 </li>
				  </ul>
			   </div>  

			   <div style="margin-top:80px; margin-bottom:20px;">
			      <ul>
				     <li style="font-size: 28px; font-weight: 900; color: #191919; text-align:center;">Partner</li>					 
				  </ul>
			   </div>

			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="margin:0px 30px;">
						<div style="background:#f8f8fb; border-radius:25px;">
						   <ul>
							  <li 1style="padding:20px 20px;">
								  <div class="sham_part">
									<ul>
									   <li><img src='board_data/1538754974_1.png'   border='0' name='bner_8'>
</li>
									   <li style="margin-top:50px;"><img src='board_data/1525138704_1.png'   border='0' name='bner_9'>
</li>
									   <li style="margin-top:50px;"><a href='http://www.naver.com/' target='_self' onfocus='blur()'><img src='board_data/1525138745_1.png'   border='0' name='bner_11'></a>
</li>

									</ul>
								 </div>
							  </li>
						   </ul>
						</div>
					 </li>
				  </ul>
			   </div>

			   <div style="width:100%; max-width:768px; margin:0 auto; text-align:center;">
				  <ul>
					 <li style="padding:80px 0px">
						<div>
						   <ul>
							  <li style="font-size: 18px; font-weight: 900; color: #191919;">개발자 X 화학자 X 화장품연구원</li>
							  <li style="font-size: 18px; font-weight: 900; color: #191919;">아름다움을 이해하는 새로운 방식</li>
						   </ul>
						</div>

						<div>
							<ul>
								<li class="m_con03_bottom_title_btn"><a href="javascript:orderMenuClick();" style="color:#fff; padding:16px 35px">
								<!--<li class="m_con03_bottom_title_btn"><a href="#" onClick="javascript:window.open('http://codeforbeauty.com/shop/skin/mall_dc/mall_order_info.html','popup','scrollbars=no, resizable=no, width=380,height=670')" style="color:#fff; padding:16px 35px">-->나의 헤어코드 입력</a></li> 
							</ul>
						</div>

						<div>
							<ul>
								<li class="m_con03_bottom_text">코드포뷰티의 제품이 고객님과 맞지 않을 시<br>새로운 레시피로 재조합해드립니다.</li>
							</ul>
						</div>

					 </li>
				  </ul>
			   </div>
			</li>
		 </ul>
	  </div>
</div>
</div></div>
		<div id="pc" style="background-color: #191919;">
		  <ul>
			  <li>
				  <div style="max-width:460px; margin:0 auto; font-size:12px; color: #474747; text-align:center;">
					  <ul>
						  <li style="padding:20px 0px;">
							  <div>
								  <ul>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="" style="color:#545454; font-size:12px; font-weight: 900;">친구추천</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./contactInformation.jsp" style="color:#545454; font-size:12px; font-weight: 900;">연락처</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./privacy.jsp" style="color:#545454; font-size:12px; font-weight: 900;">개인정보보호</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./term.jsp" style="color:#545454; font-size:12px; font-weight: 900;">약관</a></li>
									  <div style="clear:both;"></div>
								  </ul>
							  </div>
						  </li>
						  <li>주식회사 프랭클리 (Frankly Inc.)</li>
						  <li style="margin-top:20px;">사업자등록번호 : 305-86-39350 · 통신판매업신고 : 제2018-서울강서-1567호</li>
						  <li>대표이사 : 송정근 · 개인정보관리책임자 : 남우식</li>
						  <li></li>
						  <li style="margin-top:20px;">고객센터 :  02-393-8889 평일 09:00 ~ 18:00 (점심시간 12:00 ~ 13:00) 토, 일, 공휴일 휴무</li>
						  <li>주소 : 서울시 강서구 공항대로 200, 718호</li>
						  <li style="margin-top:20px;">Frankly Inc.</li>
						  <li style="margin-top:4px; padding-bottom:40px;">@ 2018 CODE FOR BEAUTY, INC. ·  ALL RIGHTS RESERVED</li>
					  </ul>
				  </div>
			  </li>
		  </ul>
	  </div>

	  <div id="mobile" style="background-color: #191919;">
		  <ul>
			  <li>
				  <div style="max-width:324px; margin:0 auto; font-size:12px; color: #474747; text-align:left;">
					  <ul>
						  <li style="padding:20px 0px;">
							  <div>
								  <ul>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="" style="color:#545454; font-size:12px; font-weight: 900;">친구추천</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./contactInformation.jsp" style="color:#545454; font-size:12px; font-weight: 900;">연락처</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./privacy.jsp" style="color:#545454; font-size:12px; font-weight: 900;">개인정보보호</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:100px; text-align:center; padding:3px 0px; margin:7px;"><a href="./term.jsp" style="color:#545454; font-size:12px; font-weight: 900;">약관</a></li>
									  <div style="clear:both;"></div>
								  </ul>
							  </div>
						  </li>
						  <li>주식회사 프랭클리 (Frankly Inc.)</li>
						  <li style="margin-top:20px;">사업자등록번호 : 305-86-39350</li>
						  <li>통신판매업신고 : 제2018-서울강서-1567호</li>
						  <li>대표이사 : 송정근 · 개인정보관리책임자 : 남우식</li>
						  <li></li>
						  <li style="margin-top:20px;">고객센터 :  02-393-8889 평일 09:00 ~ 18:00 (점심시간 12:00 ~ 13:00) 토, 일, 공휴일 휴무</li>
						  <li>주소 : 서울시 강서구 공항대로 200, 718호</li>
						  <li style="margin-top:20px;">Frankly Inc.</li>
						  <li style="margin-top:4px; padding-bottom:40px;">@ 2018 CODE FOR BEAUTY, INC. ·  ALL RIGHTS RESERVED</li>
					  </ul>
				  </div>
			  </li>
		  </ul>
	  </div>

<script src="../../code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="skin/mall_dc/js/laxicon.js"></script>
<script>
$('.parallax').laxicon();
</script></li>
</ul>
</div>
<script type="text/javascript">

function orderMenuClick() {
	<% //세션이 null이면 
	if(session.getAttribute("sessionID")==null){	%>
		alert("로그인이 필요합니다.");
		location.href='./loginPage.jsp';
	<% //세션이 null이 아니면 
	}else{ %>
		location.href='./orderPage.jsp';
	<%}%>	
}
</script>
 </body>

<!-- Mirrored from codeforbeauty.com/shop/index.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:29:39 GMT -->
</html>


<!--
 Run-time 

 Total Program Operation Time : 0.0047
-->

