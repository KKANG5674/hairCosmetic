
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

 String id = session.getAttribute("sessionID").toString();
       
 	// 세션에 저장된 아이디를 가져와서
    // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDTO member = new MemberDTO();
        member.setId(id);
        MemberDTO loginMember = MemberDAO.getDAO().getMember(id);

%>  
   

<link rel="icon" href="http://textrip.designclick.co.kr/shop/skin/mall_dc/image/favicon/codeforbeauty.ico" type="image/x-icon" />
<!DOCTYPE HTML>
<html>
<head>

<style type="text/css">
.error {
	color: red;
	position: relative;
	left: 0px;
	display: none;
	text-align: left;
}



</style>
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
  <link rel="canonical" href="http://www.codeforbeauty.com/">



    <!-- <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->

<link rel="stylesheet" href="../../code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script language="javascript" src="skin/mall_dc/js/jquery.min.js"></script>
  <script src="../../code.jquery.com/jquery-1.12.4.js"></script>
  <script src="../../code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


  <script language="javascript" src="skin/mall_dc/global.js"></script>
  <script language="javascript" src="jst/function.js"></script>

  <link rel="stylesheet" type="text/css" href="skin/mall_dc/css/style.css">


 
 <!--로그인 세션 검사 -->

 <div id="pc">
	  <div style="background-image: linear-gradient(to bottom, #e7d0f5, #ebdaf6);">
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
							<a href="index2.jsp">
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
							</a></li>
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

				</li>
			</ul>
		</div>
	 </div>
</div>


<div id="fb-root"></div>

<div>
	<div style="background-image: linear-gradient(to bottom, #ebdaf6, #f4f4f7); padding-bottom:60px;">
		<div style="width: 100%; text-align: center">
			<ul>
				<li>
					<div>
						<ul>
							<li class="sub_image">
							<img src="skin/mall_dc/image/login/login_icon.png" alt="" />	
							</li>	
						</ul>	
					</div>	
					<div>
						<ul>
							<li class="sub_sub_text">회원정보 변경</li>	
						</ul>	
					</div>
				</li>	
			</ul>	
		</div>	

</div>


<div style="background-color: #f4f4f7;">

	<div style="width:100%; max-width:740px; margin:0 auto; text-align:center; padding-top:60px;">
		<form method="post"  name="moringForm" id="morningForm" >
			<input type="hidden" name="ps_ssl" value="">
			<input type="hidden" name="ps_murl" value="m_login_ok.html">
			<input type="hidden" name="ps_mode" value="">
			<input type="hidden" name="ps_mode2" value="">
			<input type="hidden" name="ps_mode3" value="">
			<input type="hidden" name="ps_mode4" id="ps_mode4" value="">
			<input type="hidden" name="snsid" id="snsid" value="">
			<input type="hidden" name="url" value="m_mypage.html">
			<input type="hidden" name="ps_db" value="">
			<input type="hidden" name="ps_boid" value="">
			<input type="hidden" name="ps_bcid" value="">
			<input type="hidden" name="ps_line" value="">
			<input type="hidden" name="ps_choi" value="">
			<input type="hidden" name="ps_divi" value="">
			<input type="hidden" name="ps_sele" value="">
			<input type="hidden" name="ps_ques" value="">
			<input type="hidden" name="ps_page" value="">
			<input type="hidden" name="ps_ctid" value="">
			<input type="hidden" name="ps_goid" value="">
			<input type="hidden" name="ps_pname" value="">
			<input type="hidden" name="snsname" id="snsname">
		<input type="hidden" name="snsemail" id="snsemail">
		<input type="hidden" name="snsnickname" id="snsnickname">

		<style>
		.login_sns_list {max-width:460px; background:#fff; border-radius:16px; margin-top:20px;}
		.login_btn_ok {padding:12px 12px; font-size:16px; border-radius: 16px; background-color: #191919; width:275px; border:0;}
		.login_pass_fail {text-decoration:underline; color: #191919; font-weight:900; font-size:14px;}
		.login_middle_line {margin-top:41px;}
		.login_sns_icon {float:left; margin-top:4px; margin-right:10px;}
		.login_sns_text01 {text-align:center; font-size:13px; color:#3b579d; padding-top:6px;}
		.login_sns_text02 {text-align:center; font-size:13px; color:#0bc73c; padding-top:6px;}
		.login_sns_text03 {text-align:center; font-size:13px; color:##381e1f; padding-top:6px;}
		.login_title {font-size: 20px; font-weight: 900; margin-top:30px;}
		
		</style>

		<style>
		.login_input{margin-top:22px; border-bottom:2px solid #eee4ec; padding-bottom:5px;}
		::-webkit-input-placeholder { /* 크롬 4–56 */
		color: #191919;
		opacity:0.2;
		}
		:-moz-placeholder { /* 파이어폭스 4–18 */
		   color: #191919;
		opacity:0.2;
		}
		::-moz-placeholder { /* 파이어폭스 19–50 */
		   color: #191919;
		opacity:0.2;
		}
		:-ms-input-placeholder { /* 인터넷 익스플로러 10+ */
		   color: #191919;
		opacity:0.2;
		}
		::placeholder { /* 파이어폭스 51+, 크롬 57+ */
		   color: #191919;
		opacity:0.2;
		}
		</style>
		</form>
		<!-- 회원가입버튼 클릭시 페이드 활성화 시키기 -->
		<!--div class="ex_box" -->
		<div class="ex_box" style="display">
		<div class="login_title">회원정보</div>

		

     	<form method="post" action="<%=request.getContextPath()%>/codeforbeauty.com/shop/member_modify_action.jsp" name="inforForm" id="inforForm" >
		<input type="hidden" name="ps_ssl" value="">
		<input type="hidden" name="ps_murl" value="https://codeforbeauty.com/shop/m_member_ok.php">
		<input type="hidden" name="ps_mode" value="write">
		<input type="hidden" name="ps_over_id" value="">
        <input type="hidden" name="snsid" value="">
        <input type="hidden" name="snsType" id="snsType" value="">
        <input type="hidden" name="ps_mode4" value="">
        <input type="hidden" name="url" id="url" value="m_mypage.php">
		<input type="hidden" name="recommend" id="recommend" value="">
		<div style="max-width:400px; margin: 0 auto; padding-top:30px; text-align: left;">
		 <%-- 아이디 중복 검사 실행 유무를 판단하기 위한 입력태그 --%>
		<%-- => 입력태그값 : 0 - 아이디 중복 검사 미실행(아이디 사용 불가능)  --%>
		<%-- => 입력태그값 : 1 - 아이디 중복 검사 실행(아이디 사용 가능)  --%>
		   <ul>
			  <li>
				 <div>
					<ul>
					   <li class="login_input">
						<input type="text" name="id" id="id" tabindex="1" placeholder="이메일 입력"value="<%=loginMember.getId()%>" readonly="readonly" style="border:0px; width:175px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >
						
						<div id="emailMsg" class="error" style="width:500px; text-align: left;">이메일을 입력해 주세요.</div>
						<div id="emailRegMsg" class="error" style="width:500px; text-align: left;">입력한 이메일이 형식에 맞지 않습니다.</div>
						
					   </li>
					</ul>
				 </div>

				 <div>
					<ul>
					   <li class="login_input">
						<input type="password" placeholder="비밀번호 입력" name="pass1" id="passwd" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" value="">
					    <div id="passwdMsg" class="error" style="width:700px; text-align: left;">비밀번호를 입력해 주세요.( 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자 )</div>
						<div id="passwdRegMsg" class="error" style="width:700px; text-align: left;">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 6~20 범위의 문자로만 작성 가능합니다.</div>
					   </li>
					</ul>
				 </div>

				 <div>
					<ul>
					   <li class="login_input">
						<input type="password" placeholder="비밀번호 입력확인" name="pass2" id="repasswd" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" value="">
					    <div id="repasswdMsg" class="error" style="width:500px; text-align: left;">비밀번호를 입력해 주세요.</div>
					    <div id="repasswdMatchMsg" class="error" style="width:500px; text-align: left;">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
					   </li>
					</ul>
				 </div>
				 
				 <div>
					<ul>
					   <li class="login_input">
						<input type="text" name="name" id="name" tabindex="1" placeholder="이름 입력" value="<%=loginMember.getName()%>" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >
					    <div id="nameMsg" class="error" style="width:500px; text-align: left;">이름을 입력해 주세요.</div>
					   </li>
					</ul>
				 </div>
				 
				 <div>
					<ul>
					   <li class="login_input">
					   <input type="text" name="address" id="address" tabindex="1" placeholder="주소 입력" value="<%=loginMember.getAddress()%>" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >
					   <div id="addressMsg" class="error">주소를 입력해 주세요.</div>
					   </li>
					</ul>
				 </div>
				 
				 <div>
					<ul>
					   <li class="login_input">	
					   	
						<input type="radio" name="sex" id="man" value="남" style=" border:0px; width:20px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >남
						<input type="radio" name="sex" id="woman" value="여" style=" border:0px; width:20px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >여	   
					   <div id="sexMsg" class="error" style="width:500px; text-align: left;">남,녀 둘 중 하나를 체크해주세요</div>
					   </li>
					</ul>
				 </div>
				 
				 <div>
				 	<ul>
					   <li class="login_input">
						 	
						 	<input type="text" name="birthday" tabindex="1" placeholder="생년월일 입력   ex) 19910101(8자리)" value="<%=loginMember.getBirthday()%>" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" id="birthday" >		 	
					 		<div id="birthdayMsg" class="error" style="width:500px; text-align: left;">생년월일을 입력해 주세요.</div>
					 		<div id="birthdayRegMsg" class="error" style="width:500px; text-align: left;">생년월일 형식이 맞지 않습니다.</div>
 						</li>
					</ul>
				 </div>
				 
				 <div>
					<ul>
					   <li class="login_input">
						<input type="text" name="phone" id="phone" tabindex="1" placeholder="휴대폰번호 입력  ex) 01011113333" value="<%=loginMember.getPhone()%>" style="border:0px; width:295px; background:#f4f4f7; font-size:16px; color: #191919; 2opacity: 0.2;" >
					   <div id="phoneMsg" class="error">휴대폰번호를 입력해 입력해 주세요.</div>
					   <div id="phoneRegMsg" class="error" style="width:500px; text-align: left;">입력한 휴대폰번호가 형식에 맞지 않습니다.</div>
					   </li>
					</ul>
				 </div>
				 
			  </li>
		   </ul>
		</div>

		<div style="margin-top:60px; padding-bottom:60px;">
		   <ul>
			  <li class="login_btn_ok"><a href="javascript:function_user_update();" style="color:#fff; font-size:14px; padding:14px 90px;">변경</a></li>
		   <ul>
		</div>

		</form>
		</div>
	</div>

</div>
<script>
		

		
		
		
	// 변경 버튼 클릭 메소드
	function function_user_update(){
			
			$(".error").css("display","none");
			 
			//회원정보 유효성 검사
			
				//비밀번호 검사
			var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
			
			if($("#passwd").val()=="") {
				$("#passwdMsg").css("display","block");
				return false;
			} else if(!passwdReg.test($("#passwd").val())) {
				$("#passwdRegMsg").css("display","block");	
				return false;
			} 
				//비밀번호 확인 검사
			if($("#repasswd").val()=="") {
				$("#repasswdMsg").css("display","block");
				return false;
			} else if($("#passwd").val()!=$("#repasswd").val()) {
				$("#repasswdMatchMsg").css("display","block");
				return false;
			}
				//이름 검사
			if($("#name").val()=="") {
				$("#nameMsg").css("display","block");
				return false;
			}	
				//주소 검사
			if($("#address").val()=="") {
				$("#addressMsg").css("display","block");
				return false;
			}
				//성별 검사
			if($(':radio[name="sex"]:checked').length < 1) {
				$("#sexMsg").css("display","block");
				return false;
			}
				//생년월일 검사
			var dateStr = $('#birthday').val();		
	  	  	var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	   	 	var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	   	 	var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    	var today = new Date(); // 날짜 변수 선언
	    	var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
	    	if(dateStr=="") {
	    		$('#birthdayMsg').css("display","block");
	    		return false;
	    	}else if (dateStr.length <=8) {
	    		// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			    if (1900 > year || year > yearNow){
					$('#birthdayRegMsg').css("display","block");
					return false;
			    }else if (month < 1 || month > 12) {
					$('#birthdayRegMsg').css("display","block"); 
					return false;
			    }else if (day < 1 || day > 31) {
					$('#birthdayRegMsg').css("display","block"); 
					return false;
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
					$('#birthdayRegMsg').css("display","block"); 
					return false;
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
						$('#birthdayRegMsg').css("display","block"); 
						return false;
					}  	
			    }
				
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false

				$('#birthdayRegMsg').css("display","block");  
				return false;
			}
	
				//휴대폰 번호 검사
			var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{4})?([0-9]{4})$/;
			
			if($("#phone").val()=="") {
				$("#phoneMsg").css("display","block");
				return false;
			}  else if(!phoneReg.test($("#phone").val())) {
				$("#phoneRegMsg").css("display","block");
				return false;
			}
				$("#inforForm").submit();
				<%--location.href='<%=request.getContextPath()%>/codeforbeauty.com/shop/member_modify_action.jsp';--%>
	}
	
	</script>
  <!-- 카피라이트 -->
	 

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
									  <li style="float:left; background:#303030; border-radius:4px; width:74px; text-align:center; padding:3px 0px; margin:3px;"><a href="m_mypage.html#friend" style="color:#545454; font-size:12px; font-weight: 900;">친구추천</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:74px; text-align:center; padding:3px 0px; margin:3px;"><a href="m_page70f6.html?ps_pname=page_contact" style="color:#545454; font-size:12px; font-weight: 900;">연락처</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:74px; text-align:center; padding:3px 0px; margin:3px;"><a href="m_page289b.html?ps_pname=page_member" style="color:#545454; font-size:12px; font-weight: 900;">개인정보보호</a></li>
									  <li style="float:left; background:#303030; border-radius:4px; width:74px; text-align:center; padding:3px 0px; margin:3px;"><a href="m_page74d7.html?ps_pname=page_private" style="color:#545454; font-size:12px; font-weight: 900;">약관</a></li>
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
	  
	  <script type="text/javascript">

function orderMenuClick() {
	 //세션이 null이면 
	if(session.getAttribute("sessionID")==null){	
		alert("로그인이 필요합니다.");
		location.href='./loginPage.jsp';
	 //세션이 null이 아니면 
	}else{ 
		location.href='./orderPage.jsp';
	 } 
 } 
</script>
 </body>

<!-- Mirrored from codeforbeauty.com/shop/m_login.php?url=m_mypage.php by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 26 Jun 2019 08:29:51 GMT -->
</html>

<!--
 Run-time 

 Total Program Operation Time : 0.0161
-->

