function fn_list_go(page) {
	var frm = document.bbs_hidden_form;
	frm.ps_boid.value = "";
	frm.ps_page.value = page;
	frm.action = "m_board.php";
	frm.submit();
	return false;
}

function fn_write_go() {
	var frm = document.bbs_hidden_form;
	frm.ps_boid.value = "";
	frm.action = "m_write.php";
	frm.submit();
	return false;
}

function fn_view_go(ps_boid) {
	var frm = document.bbs_hidden_form;
	if(frm.ps_boid.value != ps_boid) frm.ps_pass.value = "";
	frm.action = "m_view.php";
	if(ps_boid) frm.ps_boid.value = ps_boid;
	frm.submit();
	return false;
}


function fn_view_go_faq(ps_boid) {
	var frm = document.bbs_hidden_form;
	
	var stateff = $("#board_sview_"+ps_boid).css("display");
	
	if (stateff=="none")
	{
		$("#board_sview_"+ps_boid).show();
	}else{
		$("#board_sview_"+ps_boid).hide();
	}
	

	return false;
}

function fn_list_modify() { /// 작업해야 함.
	var frm = document.bbs_hidden_form;
	var frm2 = document.uid_check_form;
	var boid = "";
	for(var i=j=0;i<frm2.length;i++) {
		if (frm2[i].type == "checkbox" && frm2[i].name == "uid_check[]" && frm2[i].checked == true) {
			boid = frm2[i].value;
			break;
		}
	}
	if(boid == "") {
		alert('수정할 대상을 하나 선택해 주세요.');
	} else {
		fn_modify_go(boid);
	}
	
	return false;
}

function fn_reply_go(ps_boid) {
	var frm = document.bbs_hidden_form;
	frm.action = "m_reply.php";
	if(ps_boid) frm.ps_boid.value = ps_boid;
	frm.submit();
	return false;
}

function fn_vote_go(ps_boid) {
	var frm = document.bbs_hidden_form;
	frm.action = frm.mobile_dir.value+"m_board_ok.php";
	frm.ps_mode.value = "vote";
	if(ps_boid) frm.ps_boid.value = ps_boid;
	frm.submit();
	return false;
}

function fn_del_comment(ps_bcid) {
	var frm = document.bbs_hidden_form;
	if( ! confirm("삭제하시겠습니까?") ) return;
	frm.action = frm.mobile_dir.value+"m_board_ok.php";
	frm.ps_mode.value = "comment_delete";
	frm.ps_bcid.value = ps_bcid;
	frm.submit();
}
function fn_del_comment2(ps_bcid) {
	var frm = document.bbs_hidden_form;
	if( ! confirm("삭제하시겠습니까?") ) return;
	frm.action = frm.mobile_dir.value+"m_login.php";
	frm.url.value = frm.mobile_dir.value+"m_board_ok.php";
	frm.ps_mode3.value = "comment";
	frm.ps_mode.value = "comment_delete";
	frm.ps_bcid.value = ps_bcid;
	frm.submit();
}

function fn_delete_go(ps_boid) {
	var frm = document.bbs_hidden_form;
	if(confirm("삭제하시겠습니까?") ) {
		frm.action = frm.mobile_dir.value+"m_board_ok.php";
		frm.ps_mode.value = "board_delete";
		frm.ps_boid.value = ps_boid;
		frm.submit();
	}
	return false;
}

function fn_modify_go(ps_boid) {
	var frm = document.bbs_hidden_form;
	frm.action = "m_modify.php";
	if(ps_boid) frm.ps_boid.value = ps_boid;
	frm.submit();
	return false;
}

function fn_bbs_mailer(email,rname) {
	open_window('mailer', 'm_mailer.php?ps_rmail='+email+'&ps_rname='+rname, 40, 40, 420, 380, 0, 0, 0, 0, 0);
	return false;
}

function fn_mail_link(email) {
	window.open('mail_link.php?email='+email, '','');
	return false;
	
}

function fn_view_div( submenu ,cellbar){
	if( faq_menu != submenu ) {
		if( faq_menu !='' ) {
			faq_menu.style.display = 'none';
		}
		submenu.style.display = 'block';
		faq_menu = submenu;
		faq_cell = cellbar;
	} else {
		submenu.style.display = 'none';
		faq_menu = '';
		faq_cell = '';
	}
}

var faq_menu = '';
var faq_cell = '';
