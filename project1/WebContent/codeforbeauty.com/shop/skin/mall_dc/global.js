
// 이미지 미리보기
function order_end(form_name){
	form_name.ps_mode.value = "write";
	form_name.action = "m_userinfo_ok.php";
	form_name.submit();
	return true;
}

function iframe_resize(arg) 
{ 
	arg.height=eval(arg.name+".document.body.scrollHeight"); 
} 

function order_back(form_name){
	form_name.ps_mode.value = "back";
	form_name.action = "m_userinfo.php";
	form_name.submit();
	return true;
}

//리스트 서치부분
function good_search(form_name,value){
	form_name.ps_line.value = value;
	form_name.submit();
	return true;
}

// 우편번호 코드 1번오픈 ( 기본 FORM )
function openzipcode1() {
    window.open("zipcode/zipcode_new.php?form=mall&zip1=zip1&zip2=zip2&address=address1","zipwin","width=609,height=465,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

// 우편번호 코드 2번 오픈  ( 기본 FORM )
function openzipcode2() {
    window.open("zipcode/zipcode_new.php?form=mall&zip1=zip3&zip2=zip4&address=address2","zipwin","width=609,height=465,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

function openzipcode_board() {
    window.open("zipcode/zipcode_new.php?form=mall_board&zip1=zip1&zip2=zip2&address=board_subject","zipwin","width=609,height=465,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

// 아이디 중복 검사 ( 기본 FORM )
function openoverlap() {
    var m=document.mall;

    if (m.id.value == "") {
        alert("ID는 필수 사항 입니다. 입력해 주세요.");
        m.id.focus();
        return false;
    }

    if ((m.id.value.length < 4) || (m.id.value.length > 16)) {
        alert("ID는 4글자 이상, 15글자 이하이여야 합니다.");
        m.id.focus();
        return false;
    }
    window.open("/shop/m_overlap.php?form=mall&focus=id&muid="+m.id.value,"overlap","width=420,height=250,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

// 입력창 늘리기
function zoomform(zooms){
    if(navigator.appName == 'Netscape') {
        alert("[입력창 늘리기]는\n\n익스플러4.0 이상의 브라우저를 사용해야\n\n사용 가능한 기능버튼입니다.\n\n네스케이프에서는 이용할 수 없습니다.");
        return;
    }

    zooms.rows = zooms.rows+5;

    //if(zooms.rows == 3){zooms.rows =  10;}
    //else if(zooms.rows == 10){zooms.rows =  20;}
    //else if(zooms.rows == 15){zooms.rows =  20;}
    //else if(zooms.rows == 20){zooms.rows =  30;}
    //else if(zooms.rows == 30){zooms.rows =  40;}
    //else {zooms.rows =  3;}
}

// 이미지 팝업창
function show_image(uid,img,width,height) {
    newWin = window.open("m_show_image.php?image="+img+"&uid="+uid,"show","width="+width+",height="+height+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no");
}

function show_mall_image(uid,img,width,height) {
    newWin = window.open("m_show_image.php?image="+img+"&uid="+uid,"show","width="+width+",height="+height+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

function show_board_image(img,width,height) {
    newWin = window.open("m_show_board_image.php?image="+img,"show","width="+width+",height="+height+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no");
}

var p_sel_num = 0;
function select_radio(num) {
   p_sel_num =  num;
}

function submit_vote() {
   if (p_sel_num == 0) {
      alert('설문 예제중에서 1개를 선택하신후 [투표] 버튼을 눌러주세요.');
      return;
   }
   winopen("m_poll_vote.php?num="+p_sel_num,"설문조사",700,450);
}

function view_vote() {
   winopen("m_poll_view.php?","설문조사",700,450);
}

function winopen(url,title,w,h) {
		newwin = window.open(url,title,"toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=1,width=" + w + ",height=" + h + ",alwaysRadised=0");
		newwin.focus();
}

// 메인 로그인 부분
function check_main_login() {
    var m=document.mall_main_login;

    if (m.login_id1.value.length == "") {
       alert("이메일을 입력하여 주세요");
       m.login_id1.focus();
	   return;
       return false;
    }

    if (m.login_pass1.value.length == "") {
       alert("패스워드를 입력하여 주세요");
       m.login_pass1.focus();
	   return;
      return false;
    }
	m.submit();

}
// 좌측 로그인 부분
function check_left_login() {
    var m=document.mall_left_login;

    if (m.login_id.value.length == "") {
       alert("아이디를 입력하여 주세요");
       m.login_id.focus();
       return false;
    }

    if (m.login_pass.value.length == "") {
       alert("패스워드를 입력하여 주세요");
       m.login_pass.focus();
      return false;
    }

}


// 회원 아이디나 찾기 패스워드 찾기
function check_member_loss() {
    var m=document.mall_loss;

    if (m.loss_email.value.length == "") {
       alert(" 이메일을 입력하여 주십시오. ");
       m.loss_email.focus();
      return false;
    }

}

// 회원 탈퇴
function check_member_delete() {
    var m=document.mall_delete;

    if (m.del_id.value.length == "") {
       alert(" 아이디를 입력하여 주십시오. ");
       m.del_id.focus();
       return false;
    }

    if (m.del_pass.value.length == "") {
       alert(" 패스워드를 입력하여 주십시오. ");
       m.del_pass.focus();
      return false;
    }

    if (m.del_name.value.length == "") {
       alert(" 이름을 입력하여 주십시오. ");
       m.del_name.focus();
       return false;
    }

    if (m.del_email.value.length == "") {
       alert(" 이메일을 입력하여 주십시오. ");
       m.del_email.focus();
      return false;
    }

}

// 간단한 서치
function check_top_search() {
    var m=document.mall_top_search;

    if (m.ps_search.value.length == "") {
       alert("검색어를 입력하여 주십시오");
       m.ps_search.focus();
       return false;
    }
}

// 새창 열기 기본 스크립트

function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
{
  toolbar_str = toolbar ? 'yes' : 'no';
  menubar_str = menubar ? 'yes' : 'no';
  statusbar_str = statusbar ? 'yes' : 'no';
  scrollbar_str = scrollbar ? 'yes' : 'no';
  resizable_str = resizable ? 'yes' : 'no';

  newWin= window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
}

// 회원 약관 확인 폼
function check_license_submit() {
	if(!document.license.accept.checked) {
		alert("[회원 약관 및 개인정보 보호정책] 을\n\n읽으시고 동의하시는 분만 회원 가입을 하실수 있습니다..\n\n모두 읽으신후 동의하시면 체크를 하신후 회원 가입하여 주세요");
		return false;
	}
	return true;
}



// 아이디 중복 검사 ( 회원 )
function open_member_overlap() {
    var m=document.mall;

    if (m.id.value == "") {
        alert("ID는 필수 사항 입니다. 입력해 주세요.");
        m.id.focus();
        return false;
    }

    if ((m.id.value.length < 4) || (m.id.value.length > 16)) {
        alert("ID는 4글자 이상, 15글자 이하이여야 합니다.");
        m.id.focus();
        return false;
    }

    window.open("m_overlap.php?form=mall&focus=id&muid="+m.id.value,"overlap","width=420,height=250,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}

// 회원 가입 체크폼

function check_member_form() { // 회원 가입 체크폼
	var m = document.morning;
    if(m.id.value == "") {
        alert("[이메일] 필수 사항 입니다. 입력해 주세요.");
        m.id.focus();
        return false;
    }
  /*
   if(m.name.value == "") {
        alert("[이름] 필수 사항 입니다. 입력해 주세요.");
        m.name.focus();
        return false;
    }
	*/

	if(m.pass1.value.length < 4 || (m.pass1.value.length > 16)) {
	   alert("[비밀번호] 4글자 이상, 15글자 이하이여야 합니다.");
	   m.pass1.focus();
	   return false;
	}

	if((m.pass1.value) != (m.pass2.value)) {
		alert("[비밀번호] 서로 같지 않습니다 정확히 입력해 주세요. ");
		m.pass1.focus();
		return false;
	}

  /*
	if(m.member_email1.value == "") {
        alert("[이메일] 필수 사항 입니다. 입력해 주세요.");
        m.member_email1.focus();
		return;
        return false;
    }

	if(m.member_email2.value == "") {
        alert("[이메일] 필수 사항 입니다. 입력해 주세요.");
        m.member_email1.focus();
		return;
        return false;
    }
  */
	m.submit();
		return ;
}


function check_userinfo() {
var m=document.mall;
var a; 
	for(i=0;i < document.mall.buyer_payment.length;i++) { 
    if(document.mall.buyer_payment[i].checked == true) 
        a = document.mall.buyer_payment[i].value 
	}
	if ( m.buyer_name1.value.length == "" ) {
		alert("[구매자 성함]는 필수 항목 입니다. 입력해 주십시오." );
		m.buyer_name1.focus();
		return false;
	}
	if ( m.buyer_tel1.value.length == "" ) {
		alert( "[전화번호]는 필수 항목 입니다. 입력해 주십시오." );
		m.buyer_tel1.focus();
		return false;
	}
	if ( m.zip1.value.length == "" || m.zip2.value.length == "") {
		alert( "[우편번호]는 필수 항목 입니다. 입력해 주십시오." );
		m.zip1.focus();
		return false;
	}
	if ( m.address1.value.length == "" ) {
		alert( "[구매자 주소]는 필수 항목 입니다. 입력해 주십시오." );
		m.address1.focus();
		return false;
	}
	if ( m.buyer_email.value.length == "" ) {
		alert( "[구매자 메일]는 필수 항목 입니다. 입력해 주십시오." );
		m.buyer_email.focus();
		return false;
	}
	if ( m.buyer_name3.value.length == "" ) {
		alert( "[받는분성명]은 필수 항목 입니다. 입력해 주십시오." );
		m.buyer_name3.focus();
		return false;
	}		
	if (a== "2" ) {
		if ( m.buyer_name2.value.length == "" ) {
			alert( "[입금자명]은 필수 항목 입니다. 입력해 주십시오." );
			m.buyer_name2.focus();
			return false;
		}
	}		
}

// 같은 내용 카피
function accept_check(){
   var m = document.mall;
   m.buyer_name3.value = m.buyer_name1.value;
   m.buyer_tel3.value = m.buyer_tel1.value;
   m.buyer_tel4.value = m.buyer_tel2.value;
   m.zip3.value = m.zip1.value;
   m.zip4.value = m.zip2.value;
   m.address2.value = m.address1.value;
   m.address2_d.value = m.address1_d.value;
}

// 에러시 체크
function error (elem,text) {
	window.alert(text);
	elem.select();
	elem.focus();
}


// 주민번호 체크
function jumincheck(jumin1 ,jumin2) {

		var str_jumin1 = jumin1.value;
		var jumin1_err = jumin1;
		var str_jumin2 = jumin2.value;
		var jumin2_err = jumin2;
		var checkImg='';


		var i3=0
		for (var i=0;i<str_jumin1.length;i++)
		{
		    var ch1 = str_jumin1.substring(i,i+1);
		    if (ch1<'0' || ch1>'9') { i3=i3+1 }
		}
		if ((str_jumin1 == '') || ( i3 != 0 ))
		{
  		  error(jumin1_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
  		  return false;
		}


		var i4=0
		for (var i=0;i<str_jumin2.length;i++)
		{
		    var ch1 = str_jumin2.substring(i,i+1);
		    if (ch1<'0' || ch1>'9') { i4=i4+1 }
		}
		if ((str_jumin2 == '') || ( i4 != 0 ))
		{
		    error(jumin2_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
		    return false;
		}

//		if(str_jumin1.substring(0,1) < 4)
//		{
//   	  error(jumin2_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
//   	  return false;
//		}

		if(str_jumin2.substring(0,1) > 2)
		{
		    error(jumin2_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
		    return false;
		}

		if((str_jumin1.length > 7) || (str_jumin2.length > 8))
		{
		    error(jumin2_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
		    return false;
		}

		if ((str_jumin1 == '72') || ( str_jumin2 == '18'))
		{
		  error(jumin1_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
		  return false;
		}

		var f1=str_jumin1.substring(0,1)
		var f2=str_jumin1.substring(1,2)
		var f3=str_jumin1.substring(2,3)
		var f4=str_jumin1.substring(3,4)
		var f5=str_jumin1.substring(4,5)
		var f6=str_jumin1.substring(5,6)
		var hap=f1*2+f2*3+f3*4+f4*5+f5*6+f6*7
		var l1=str_jumin2.substring(0,1)
		var l2=str_jumin2.substring(1,2)
		var l3=str_jumin2.substring(2,3)
		var l4=str_jumin2.substring(3,4)
		var l5=str_jumin2.substring(4,5)
		var l6=str_jumin2.substring(5,6)
		var l7=str_jumin2.substring(6,7)
		hap=hap+l1*8+l2*9+l3*2+l4*3+l5*4+l6*5
		hap=hap%11
		hap=11-hap
		hap=hap%10
		if (hap != l7)
		{
		  error(jumin1_err,'주민등록번호가 잘못되었습니다.\n\n다시입력해주세요!');
		  return false;
		}


		var i9=0

		return true;

}


function check_member_modify() {
	var m=document.mall;
	if (m.pass1.value.length > 0) {
		if (m.pass1.value.length < 4) {
		   alert("비밀 번호는 4글자 이상이어야 합니다.");
		   return false;

		}

		if ((m.pass1.value) != (m.pass2.value)) {
			alert("비밀번호 같지 않습니다 정확히 입력해 주세요. ");
			m.pass1.focus();
		   return false;
		}
	}

	if (m.old_pass.value.length == "") {
		alert("기존패스워드는 필수 항목입니다. 입력 하여 주세요.");
		m.old_pass.focus();
		return false;
	}

	

	

	m.submit();

}


// 삭제시 물어보는 스크립트
function del_really(){
    if (confirm('\n삭제는 복구가 불가능합니다.\n삭제시 데이터는 완전 삭제됩니다.\n\n(정말로 삭제하시겠습니까?)\n')) return true;
    return false;
}

// 폼 메일러
function mall_mailer_check() {
    var m=document.mall_mailer;

    if (m.mailer_receive_email.value.length == "") {
       alert("받는분 이메일은 필수 입니다.");
       m.mailer_receive_email.focus();
      return false;
    }

    if (m.mailer_subject.value.length == "") {
       alert("메일 제목은 필수 입니다.");
       m.mailer_subject.focus();
      return false;
    }

    if (m.mailer_body.value.length == "") {
       alert("메일 내용은 필수 입니다.");
       m.mailer_body.focus();
      return false;
    }

}

// 폼 메일러
function mall_recommend_check() {
    var m=document.mall_mailer;

    if (m.mailer_receive_email.value.length == "") {
       alert("받는분 이메일은 필수 입니다.");
       m.mailer_receive_email.focus();
      return false;
    }
}

function really_all(){
    if (confirm('\n삭제는 복구가 불가능합니다.\n삭제시 데이터는 완전 삭제됩니다.\n\n(정말로 삭제 하시겠습니까?)\n')) 
	{ 
	  document.uid_check_form.submit();
	}
    return false;
}


//---------------------------------------------------------------------이노시작

//******************************************************************************************************
// Eexplanation : id값을 숨기거나 보여준다.
//******************************************************************************************************
function showmenu(str) {
	str.style.display = "";
}

function hidemenu(str) {
	str.style.display = "none";
}

//******************************************************************************************************
// Eexplanation : RollOver 버튼
//******************************************************************************************************
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
function show_image(img,width,height) {
    newWin = window.open("show_image.htm?image="+img,"show","width="+width+",height="+height+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
}
function PrintEmbed(emb_id){ 
	document.write(document.getElementById(emb_id).value);
} 

//게시판 전체선택
function board_select_all() { 
   if(uid_check_form.check_all.checked == true){

	   for( var i=0; i< uid_check_form.elements.length; i++) { 
		  var m = uid_check_form.elements[i];  
		  if ((m.name == "uid_check[]") && (m.type=="checkbox")) {
			  m.checked = true; 
		  }
	   }
   }else{
	   for( var i=0; i< uid_check_form.elements.length; i++) { 
		  var m = uid_check_form.elements[i]; 
		  if ((m.name == "uid_check[]") && (m.type=="checkbox")) {
			  m.checked = false; 
		  }
	   } 
   }
return; 
} 


function number_format2(num) { 
  var num_str = num.toString() 
  var result = ''

  for(var i=0; i<num_str.length; i++) { 
      var tmp = num_str.length-(i+1) 
      if(i%3==0 && i!=0) result = ',' + result 
      result = num_str.charAt(tmp) + result 
  } 
  return result 
} 


function is_num(num) { 
    var numPattern = /([^0-9])/;
	if(num.match(numPattern)){ 
		return 0;
	}else{
		if(!num){
			return 0;
		}else{
			return num;
		}	
	}
} 

function targetForm(url) { 
window.open(url);
} 



	//센터정렬일경우
	var layer_malign = "left";
	var layer_mtop  = 170;
	var layer_mleft = 170;
	var layer_minterval = 23;
	var old_layer_index = 0;
	var category_length = 0;
	function show_mlayer(index) {
		var now_winwidth = document.body.clientWidth;

		var left_margin  = 0;
		if (now_winwidth > 980) {
			if(layer_malign =="center")
				left_margin = (now_winwidth-980)/2;

		}  
		var layer_name = "div"+index;
		var top_start = layer_mtop;
		var left_start = layer_mleft;
		var layer_interval = layer_minterval;

		if (old_layer_index != 0 && old_layer_index != index) {
			var old_layer_name = "div"+old_layer_index;
			document.all[old_layer_name].style.visibility = "hidden";
			//alert(old_layer_name);
		}
		old_layer_index = index;


		hide_mlayer_exclusive(index);
		document.all[layer_name].style.top = top_start + (index-1)*layer_interval;
		document.all[layer_name].style.left = left_margin + left_start;
		document.all[layer_name].style.visibility = "visible";

	}


	function hide_mlayer_exclusive(index) {
		for (var i = 1; i <= category_length; i++) {
			if (i != index) document.all["div"+i].style.visibility = "hidden";

		}
	}


	function hide_mlayer(index) {
		var layer_name = "div"+index;
		document.all[layer_name].style.visibility = "hidden";
		//alert(layer_name);

	}

/////////////////////////////////////////
// 왼쪽 바로가기 메뉴 관련 스트립트 시작 //
/////////////////////////////////////////

var stmnLEFT = 1020; // 왼쪽 여백 (메뉴가 왼쪽에서 10픽셀 떨어진 곳에 보여집니다)
//var stmnLEFT = ""; // 중앙정렬 사이트에 경우 위에줄 주석처리하고 이줄 주석해제

var stmnGAP1 = 130; // 위쪽 여백 (메뉴가 위에서 10픽셀 떨어진 곳에 보여집니다)
var stmnGAP2 = 20; // 스크롤시 브라우저 위쪽과 떨어지는 거리
var stmnBASE = 117; // 스크롤 시작위치 
var stmnActivateSpeed = 0;
var stmnScrollSpeed = 10;

var stmnTimer; 

function ReadCookie(name) { 
var label = name + "="; 
var labelLen = label.length; 
var cLen = document.cookie.length; 
var i = 0; 

while (i < cLen) { 
var j = i + labelLen; 

if (document.cookie.substring(i, j) == label) { 
var cEnd = document.cookie.indexOf(";", j); 
if (cEnd == -1) cEnd = document.cookie.length; 
return unescape(document.cookie.substring(j, cEnd)); 
} 
i++; 
} 
return ""; 
} 

function SaveCookie(name, value, expire) { 
var eDate = new Date(); 
eDate.setDate(eDate.getDate() + expire); 
document.cookie = name + "=" + value + "; expires=" +eDate.toGMTString()+ "; path=/"; 
} 

function RefreshStaticMenu() 
{ 
var stmnStartPoint, stmnEndPoint, stmnRefreshTimer; 

stmnStartPoint = parseInt(STATICMENU.style.top, 10); 


stmnEndPoint = document.body.scrollTop + stmnGAP2; 

stmnLimit = parseInt(window.document.body.scrollHeight) - parseInt(STATICMENU.offsetHeight); 
if (stmnEndPoint > stmnLimit) stmnEndPoint = stmnLimit; 

if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 

stmnRefreshTimer = stmnActivateSpeed; 

if ( stmnStartPoint != stmnEndPoint ) { 
stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
STATICMENU.style.top = parseInt(STATICMENU.style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ); 
stmnRefreshTimer = stmnScrollSpeed; 
} 

stmnTimer = setTimeout ("RefreshStaticMenu();", stmnRefreshTimer); 
} 

function ToggleAnimate() { 
if (!ANIMATE.checked) { 
RefreshStaticMenu(); 
SaveCookie("ANIMATE", "true", 300); 
} else { 
clearTimeout(stmnTimer); 
STATICMENU.style.top = stmnGAP1; 
SaveCookie("ANIMATE", "false", 300); 
} 
} 

function InitializeStaticMenu() { 
if(stmnLEFT) STATICMENU.style.left = stmnLEFT; 
if (ReadCookie("ANIMATE") == "false") { 
ANIMATE.checked = true; 
STATICMENU.style.top = document.body.scrollTop + stmnGAP1; 
} else { 
ANIMATE.checked = false; 
STATICMENU.style.top = document.body.scrollTop + stmnBASE; 
RefreshStaticMenu(); 
} 
} 


// 이미지 팝업창
function show_large(uid,img,width,height) {
    newWin = window.open("m_show_image.php?image="+img+"&uid="+uid,"show","width="+width+",height="+height+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no");
}

//---------------------------------------------------------------------이노끝


//네비게이션 마우스롤오버
function onimg(num,rollno)
{
	document.images[rollno].src=num;
}
function offimg(num,rollno)
{
	document.images[rollno].src=num;
}


function bluring(){
  if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
}

document.onfocusin=bluring;



/******************************************************************
title : dggEmbed v1.1
contents : IE패치로 인한 embed 태그를 js로 출력한다.
이 소스가 들어가는 JS파일은 반드시 src로 외부에서 호출되어야하고
<script>dggEmbed("src=source.swf","width=100","height=100", "wmode=Tranpsarent");</script>
와 같은 형식으로 플래쉬 태그를 대신해서 넣어준다.
mGET 함수는 두배열을 이용한 키값의 Data 를 가져오는 함수.(dggEmbed에 필요)
ex) srcdata = mGET(key,value,'src'); -> php의 $srcdata = $array['src'];
by : http://blog.daum.net/battlej


실제 적용방법
<script>dggEmbed('src=파일명','width=파일가로사이즈','height=파일세로사이즈', 'wmode=Transparent');</script>

인수를 더 넣을때는 계속 'name=value' 로 추가할 수 있습니다.

<script>dggEmbed('src=g.swf?name=value','width=400','height=300', 'wmode=Transparent', 'bgcolor=#ffffff');</script>

bgcolor 의 값을 추가 할때는

<script>dggEmbed('src=g.swf','width=400','height=300', 'wmode=Transparent', 'bgcolor=#ffffff');</script>


******************************************************************/

function mGET(arrayKey, arrayValue, Value) {
	count = arrayKey.length;
	for(i=0;i<count;i++) {
		if(arrayKey[i]==Value) {
			return arrayValue[i];
			break;
		}
	}
}

function dggEmbed() {
	var key = new Array();
	var value = new Array();
	var contents;
	var embed_type;
	var error_check=0;
	var i, j;
	var count;
	var data;
	var temp;
	if(dggEmbed.arguments.length==1) {
		contents = dggEmbed.arguments[0];
	} else {
		for(i=0;i<dggEmbed.arguments.length;i++) {
			temp = dggEmbed.arguments[i].replace(/"|'/g,"");
			data = temp.split('=');
			key[i] = data[0];
			value[i] = data[1];
			count = data.length;

			for(j=2;j<count;j++) {
				value[i] += '=' + data[j];
			}
		}

		contents='';
		srcdata = mGET(key,value,'src');

		if(/\.(swf)$/.test(srcdata)) {
			embed_type = 1;
		} else if(/\.(mov|avi|wma|wmv)$/.test(srcdata)) {
			embed_type = 2;
		}

		var classid = mGET(key,value,'classid');
		var codebase = mGET(key,value,'codebase');

		if(embed_type==1) {
			classid = 'clsid:D27CDB6E-AE6D-11cf-96B8-444553540000';
			codebase = 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0';
		} else if(embed_type==2) {
			classid = 'clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95';
			codebase = 'http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715';
		}

		if(classid && codebase) {
			contents += '<object';
			if(classid) {
				contents += ' classid="' + classid + '"';
			}
			if(codebase) {
				contents += ' codebase="' + codebase + '"';
			}
			count = key.length;
			for(i=0;i<count;i++) {
				if(value[i]!='') {
					if(key[i]!='src') {
						contents += ' ' + key[i] + '="' + value[i] + '"';
					}
				}
			}
			contents += '>';
			for(i=0;i<count;i++) {
				if(value[i]!='') {
					if(embed_type==1 && key[i]=='src') {
						contents += '<param name="movie" value="' + value[i] + '" />';
					} else {
						contents += '<param name="' + key[i] + '" value="' + value[i] + '" />';
					}
				}
			}
		}
		count = key.length;
		contents += '<embed';
		for(i=0;i<count;i++) {
			if(value[i]!='') {
				contents += ' ' + key[i] + '="' + value[i] + '"';
			}
		}
		contents += '>';
		contents += '</embed>';
		if(classid && codebase) {
			contents += '</object>';
		}
	}
	document.write(contents);
}

function createAjax() {
  if(typeof(ActiveXObject) == "function") {
	return new ActiveXObject("Microsoft.XMLHTTP");  
  }  
  else if(typeof(XMLHttpRequest) == "object" || typeof(XMLHttpRequest) == "function") {
	return new XMLHttpRequest();
  }  
  else {
	self.alert("브라우저가 AJAX를 지원하지 않습니다.");
	return null;
  }
}  
myAjax = createAjax();

function sendRequest(url,frameworkLayer) {
	myAjax.open("get",url);
	myAjax.onreadystatechange = function receiveResponse() {

		if(myAjax.readyState == 4 && myAjax.status == 200) {
			frameworkLayer.innerHTML = myAjax.responseText;
		}

	}
	myAjax.send('');
}


function fn_sns_send(ty,mess,r_url,image) { // sns 전송
	var content = encodeURIComponent(mess);
	var link = encodeURIComponent(r_url);
	var url = "";

	if(ty=="f") {
		var sendUrl = "http://www.facebook.com/sharer.php?s=100&p[url]="+r_url+"&p[images][0]="+image+"&p[title]="+mess;
		sendUrl = sendUrl.split("#").join("");
		sendUrl = encodeURI(sendUrl);
		window.open(sendUrl, "", "width=500px, height=300px, toobar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no");

	} else if(ty=="t") {
		url = "http://twitter.com/home?status="+content+" "+link;
		window.open(url,"","");
	} else if(ty=="m") {
		url = "http://me2day.net/posts/new?new_post[body]="+content+" "+link;
		window.open(url,"","");
	} else if(ty=="y") {
		url = "https://yozm.daum.net/api/popup/prePost?prefix="+content+"&link="+link;
		window.open(url,"","");
	}

	return false;

}

function bookmark(url, title){
	//window.external.AddFavorite('<?=$cf_mall_url;?>', '<?=$cf_mall_name;?> 방문을 환영합니다. ')
	if(document.all) {
       window.external.AddFavorite(url, title); 
   }
   // Google Chrome
   else if(window.chrome) {
      alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
   }
   // Firefox
   else if (window.sidebar) // firefox 
   {
       window.sidebar.addPanel(title, url, ""); 
   }
   // Opera
   else if(window.opera && window.print)
   { // opera 
      var elem = document.createElement('a'); 
      elem.setAttribute('href',url); 
      elem.setAttribute('title',title); 
      elem.setAttribute('rel','sidebar'); 
      elem.click(); 
   }
   return false;
}
/*******************************************************************************************************/