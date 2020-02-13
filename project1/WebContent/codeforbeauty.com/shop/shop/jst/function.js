<!--
function fn_input_focus(id) {
	$('#'+id).addClass('blank');
}

function fn_input_blur(id) {
	if($('#'+id).val() == "") {
		$('#'+id).removeClass('blank');
	}
	
}

function fn_no_right_mouse() {
	var NoMouseMess = "";
	if (event.button == 2) {
       if(NoMouseMess) alert(NoMouseMess);
	   else { document.oncontextmenu = function() { return false; } }
	}
}

function fun_focus(obj,val) {
	if(obj.value==val) {
		obj.value="";
	}
	return false;
}

function fun_blur(obj,val) {
	if(obj.value=="") {
		obj.value=val;
	}
	return false;
}

function fn_number_format(str_price) {
   var str_len_div = parseInt(str_price.length/3);
   var str_len_mod = str_price.length%3;
   var new_price = str_price.substr(0,str_len_mod);
   if(str_price.length > 3) {
      
	  for(var i=0;i<str_len_div;i++) { new_price += ',' + str_price.substr((str_len_mod + (i*3)),3);     }

      if(new_price.indexOf(",") == 0) new_price = new_price.substring(1);

   } else new_price = str_price;

   return new_price;
}

function fun_frm_back(frm,url,st) {
	if(url !="" && st != "") {
		frm.act.value = st;
		frm.is_back.value = st;
		frm.action = url;
		frm.submit();
	} else {
		alert('오류가 발생했습니다.');
	}
	return ;
}


function fn_get_format(TmpValues,strformat) {
	var str = "";
	if(strformat=="nn") {
		strformat = "0123456789";
	} else if(strformat=="ns") {
		strformat = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	} else if(strformat=="ss") {
		strformat = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	}

	for (var i=0; i<TmpValues.length;i++) {
		ch=strformat.indexOf(TmpValues.charAt(i));
		if (ch >= 0) {
			str += TmpValues.charAt(i);
		} // if end
	} // for end
	return str;

}

function fun_radio_val(obj) { 
   var s_val = "";
   var n_len = 0;
   if(obj) {
      n_len = obj.length;
      if(typeof(n_len) == 'undefined' || !n_len) {
         if(obj.checked == true) {  s_val = obj.value; }
      } else {
         for(var j=0; j < n_len; j++) {
            if(obj[j].checked == true) {  s_val = obj[j].value; break; }
         }
	  }
   }
   return s_val;
}

function fun_radio_len(obj) {
   var n_len = 0;
   if(obj) {
      n_len = obj.length;
      if(typeof(n_len) == 'undefined' || !n_len) {
        n_len = 1;
      }
   }
   return n_len;
}

function fun_check_cnt(frm,oName) {
	var oLen = frm.length;
	var nCnt = 0;
	for(var i=0; i < oLen ; i++) {
		if((frm[i].type == "checkbox") && (frm[i].name == oName) && (frm[i].checked == true)) {
			nCnt++;
		}
	}
	return nCnt;
}

function fun_check_seled(obj,oName) {
	var frm = obj.form;
	var oLen = frm.length;
	var nCnt = 0;
	var bVal = obj.checked;
	
	for(var i=0; i < oLen ; i++) {
		if((frm[i].type == "checkbox") && (frm[i].name == oName)) {
			frm[i].checked = bVal;
			nCnt++;
		}
	}
	return nCnt;
}


function fun_write_ok(frm) {
	var arr,arr_sub,obj;
	var is_err = false;

	if(frm.chk_action.value != "") {
		arr = frm.chk_action.value.split(";");
		 for(var i=0; (i < arr.length && (is_err==false)); i++) {
			arr_sub = arr[i].split("|");
			obj = eval('frm.'+arr_sub[0]);
			if((obj.value == "") || (obj.value ==arr_sub[3])) {
				if(arr_sub[1]=="S") {
					alert('[ '+arr_sub[2]+' ] 선택해 주세요.');
					obj.focus();
					is_err=true;
					break;
				} else {
					alert('[ '+arr_sub[2]+' ] 입력해 주세요.');
					obj.focus();
					is_err=true;
					break;
				}
			}
		 }
	}
	
	return is_err;
}