<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type = "text/css">
	.main{
		box-sizing: border-box;
		padding: 10px;
	}
	#aTitle {
		font-size: 25px;
		padding : 10px 0;
		padding-left : 5px;
		border : 1px solid graytext;
		display: block;
		border-bottom: 1px solid #73879C;
		margin-bottom: 15px;
	}
	#orderNo{
		font-weight: bold;
	}	
	#orderTable{
			margin-top : 30px;
			width: 100%;
			border: 2px solid lightgrey;
			font-size: 15px;
		}
		#orderTable tr.viewImg{
			border-bottom: 1px solid black;
			height: 100px;
		}
		#orderTable tr.viewImg:LAST-CHILD{
			border-bottom: none;
		}
		#orderTable tr > *{
			text-align : center;
			padding: 15px 0px;
			vertical-align: middle;
		}
		.clickEvent{
			background-color : lightgray;
			height: auto;
			text-align: left;
		}
		#tableH{
			font-weight: bold;
			font-size: 18px;
			border-bottom: 1px solid black;

		}
		.viewImg a{
			width: 150px;
			height: 150px;
			display: inline-block;
		}
		.viewImg img{
			width: 100%;
			height: 100%;
			display: inline-block;
		}
		.hahaha td{
			border-bottom: 1px solid grey;
		}
		.pagingNumbers{
			font-size: 25px;
			margin-top: 15px;
		}
		.viewImg{
			border-left: 1px solid black;		
		}
		#gogoList{
			text-align: center;
		}
		#gogogogogogo,#refund{
			border: 1px solid black;
			margin: 30px 0;
			background-color: black;
			color: white;
			padding: 10px 5px;
			font-size: 18px;
			cursor: pointer;
		}
		.hihihi{
			color:black;
			margin-bottom: 10px;
			font-weight: bold;
			text-decoration: underline;
		}
		.o_numLine{
			margin-bottom: 10px;
		}
		.forbold{
			display : inline-block;
			font-weight: bold;
		}
		.arrayLine > div{
			margin-bottom: 10px;
		}
		.o_info2{
			margin-bottom: 0px;
		}
		.orderInfo{
			margin-top: 50px !important;
		}
		.orderInfo tr{
			border-top: 1px solid lightgrey;
		}
		.orderInfo tr th,td{
			padding: 15px 0;
		}
		.orderInfo tr td{
			color: graytext;
		}
		.lastLine{
			border-bottom: 1px solid lightgrey;
		}
		.orderInfo > table {
			width: 100%;
			text-align: left;
			font-size: 18px;
		}
		.orderInfo > h3{
			font-size: 25px;
			font-weight: bold;
			margin-bottom: 20px;
			text-decoration: underline;
		}
</style>
<div class = "main">
	<h2 id = "aTitle">주문번호 <span id = "orderNo">${param.o_num }</span>의 상세 내역</h2>
	<div class= "orderList">
		<table id = "orderTable">
			<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="20%">
				<col width="15%">
				<col width="20%">
			</colgroup>
			<tr id = "tableH">
				<th colspan="2">상품 정보</th>
				<th>결제금액</th>
				<th>진행현황</th>
				<th>주문날짜</th>
			</tr>
			<c:if test="${empty orderList }">
				<tr>
					<td colspan="5">잘못된 접근입니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty orderList }">
				<c:forEach items="${orderList }" varStatus="status">
					<tr class = "hahaha">
						<td class= "viewImg" data-num = "${orderList[status.index].o_no }"><a href = "/detail?no=${orderList[status.index].p_no }"><img src = "/productUpload/${orderList[status.index].pi_file }"></a></td>
						<td class = "arrayLine">
							<div class= "o_nameLine">
								${orderList[status.index].p_type }
							</div>
							<div class= "o_info">
								[${orderList[status.index].p_name }] <span class = "forbold">${orderList[status.index].p_no }</span>
							</div>
							<div class= "o_info2">
								${orderList[status.index].p_size }/${orderList[status.index].p_color }/${orderList[status.index].o_cnt }(개)
							</div>
						</td>
						<td>
							<div class ="o_priceLine">
								${orderList[status.index].o_price }
							</div>
						</td>
						<c:if test="${orderList[status.index].o_confirm eq 'Y' }">
							<td>결제완료</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'N' }">
							<td>입금대기</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'R' }">
							<td>환불대기</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'F' }">
							<td>환불완료</td>
						</c:if>
						<td>${orderList[status.index].o_date }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<c:if test="${not empty orderList }">
		<div class = "orderInfo">
			<h3>주문 고객 정보</h3>
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th>주문하시는 분</th>
					<td>${vo.m_name }</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${vo.m_tel }</td>
				</tr>
				<tr class = "lastLine">
					<th>이메일</th>
					<td>${vo.m_email }</td>
				</tr>
			</table>	
		</div>
		<div class = "orderInfo">
			<h3>결제 정보</h3>
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th>결제방법</th>
					<td>${orderList[0].o_mode }</td>
				</tr>
				<tr class = "lastLine">
					<th>결제금액</th>
					<td id = "ggg"></td>
				</tr>
			</table>	
		</div>
		<div class = "orderInfo">
			<h3>배송 정보</h3>
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr class = "lastLine">
					<th>주소</th>
					<td id = "ggg2">${orderList[0].m_addr }</td>
				</tr>
			</table>	
		</div>				
	</c:if>
	
	<div id = "gogoList">
		<c:if test="${orderList[0].o_confirm eq 'Y' }">
			<input type = "button" id = "refund" value="환불 신청하기">
		</c:if>
		<input type = "button" id = "gogogogogogo" value="목록으로 가기" />
	</div>
	<c:if test="${not empty orderList }">
		<div class= "hiddenLine">
			<form id = "yoyoyoyo">
				<input type = "hidden" id = "o_numLine" name = "o_num" value="${orderList[0].o_num }">
			</form>
		</div>
	</c:if>
</div>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<script type = "text/javascript">
	$(document).ready(function(){
		var o_priceLine = $(".o_priceLine").length;
		var o_priceTotal = 0;
		for(var i = 0; i < o_priceLine; i++ ){
			var kikiki = $(".o_priceLine").eq(i).text();
			o_priceTotal += (kikiki * 1);
		}

		$("#ggg").text(o_priceTotal + "(원)");
		$("#gogogogogogo").click(function(){
			location.href="/member/mypage/orderlist";
		});
	});
</script>
<c:if test="${orderList[0].o_confirm eq 'Y' }">
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#refund").click(function(){
				if(confirm("정말로 환불하시겠습니까?")){
					$.ajax({
						url : "/member/mypage/odrerRefundRequest",
						data : $("#yoyoyoyo").serialize(),
						dataType : "text",
						type  : "post",
						error : function(){
							alert("시스템 에러입니다.");
						},
						success : function(result){
							if(result == "success") location.reload();
							else alert("시스템 에러입니다.");
						}
					});
				}
				else return;
			});
		});
	</script>
</c:if>