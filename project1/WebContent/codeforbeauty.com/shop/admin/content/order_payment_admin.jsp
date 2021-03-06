<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="content">
    <div id="header">
        <h2>배송 관리</h2>
    </div>
     <div id="section">
        <div>
            <table id="optionArea" border="1">
                <caption>배송 관리</caption>
                <colgroup>
                    <col width="140px" />
                    <col width="670px" />
                    <col width="150px" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">검색어</th>
                    <td>
                        <select name="search_type" class="fSelect">
                            <option value="" selected>---- 선택 ----</option>
                            <option value="no">주문번호</option>
                            <option value="member_id">아이디</option>
                            <option value="name">이름</option>
                        </select>
                        <input type="text" name="type" value="" class="fText" style="width:240px;">
                    </td>
                    
                    <td rowspan="3" style="text-align: center; padding: 5px">
                           <input id="select" type="button" value="검색">
                           <input id="select" type="button" value="초기화">
                    </td>      
                   
                </tr>
                <tr>
                    <th scope="row">주문일</th>
                    <td>
                          <input type="date" id="order_start_date" name="order_start_date" class="fText gDate" value="2019-07-15" > - 
                          <input type="date" id="order_end_date" name="order_end_date" class="fText gDate" value="2019-07-15" >
                    </td>
                </tr>
                <tr>
                    <th scope="row">상품</th>
                    <td>
                        <div>
                            <input type="radio" id="product_shampoo" name="product_select" value="샴푸">샴푸 
                            <input type="radio" id="product_conditioner" name="product_select" value="컨디셔너">컨디셔너 
                            <input type="radio" id="product_both" name="product_select" value="둘다">샴푸 & 컨디셔너
                        </div>    
                    </td>
                </tr>
                    
               
  <!-- 주문 목록 -->
    <div>
       <br>
    </div>
    <div id="section">
        <div>
            <table id="optionArea2">
                <caption>주문정보검색목록</caption>
                <colgroup>
                    <col width="120px" />
                    <col width="120px" />
                    <col width="140px" />
                    <col width="150px" />
                    <col width="150px" />
                    <col width="150px" />
                    <col width="140px" />
                    <col width="140px" />
                    <col width="140px" />
                    <col width="140px" />
                    <col width="140px" />
                </colgroup>
                <tbody>
                    <tr id="option">
                        <th>주문일</th>
                        <th>주문번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>상품</th>
                        <th>결제완료여부</th>
                        <th>배송상태</th>
                        <th>입금은행</th>
                        <th>입금자명</th>
                        <th>현금영수증</th>
                        <th>체크</th>
                    </tr>
                      <tr>
                        <th>2019.07.16</th>
                        <th>0002</th>
                        <th>shampoo</th>
                        <th>강형섭</th>
                        <th>샴푸</th>
                        <th>
                        <select name="search_type" class="fSelect">   
                            <option value="no">N</option>
                            <option value="yes">Y</option>              
                        </select>
                        </th>
                        <th>
                        <select name="search_type" class="fSelect">
                            <option value="cashReady">입금전</option>
                            <option value="deliveryReady">배송준비</option>
                            <option value="do">배송중</option>
                            <option value="done">배송완료</option>
                        </select>
                        </th>
                        <th>신한은행</th>
                        <th>강형섭</th>
                        <th>
                        <select name="search_type" class="fSelect">    
                            <option value="noCash">신청안함</option>
                            <option value="bossCash">사업자증빙</option>
                            <option value="personCash">개인소득공제</option>
                        </select>
                        </th>
                        <th>
                            <input id="update" type="button" value="저장">
                            <input id="delete" type="button" value="삭제">
                        </th>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>