<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
<style type = "text/css">
#pTitle{
		font-size: 3rem;
		display: inline-block;
		border-bottom: 1px solid #73879C;
		margin-bottom: 3rem;
	}
#searchLine{
	margin-bottom: 30px;
}
#slave {
	width: 100%;
	margin-bottom: 30px;
}

#slave tr > th,td {
	vertical-align: middle;
	text-align: center;
	padding: 10px 0;
}
#slave th{
	border: 1px solid #73879C;
	font-size: 1.5rem;
	font-weight: bold;
}
#slave td{
	border-bottom: 1px solid #73879C;
	font-size: 1.5rem;
}
.pageLow{
	border-bottom: none !important;
	font-size : 1.8rem !important;
	padding-top: 20px; 
}
.lightBorder{
	border-left: 1px solid #73879C;
}
#searchLine{
	display: inline-block;
	clear: both;
}
#searchLine > h4{
	font-weight: bold;
}
#searchLine > div label{
	width: 75px;
}
#gogogogo{
	margin-left: 30px;
	cursor: pointer;
}
.goF{
	margin-left: 5px;
	border: none;
	cursor: pointer;
}
</style>
<div class = "main">
	<h2 id = "pTitle">미결제 목록</h2>
	<form id = "searchForm">
		<div id = "searchLine">
			<h4>검색하기</h4>
			<div id = "line1">
				<label for="m_idView">아이디</label>
				<input type = "text" id = "m_idView" name = "m_nameView" value="${adminVO.m_id }">
			</div>
			<div id = "line2">
				<label for = "m_nameView">이름</label>
				<input type = "text" id = "m_nameView" name = "m_nameView" value="${adminVO.m_name }">
				<input type = "button" id = "gogogogo" value="검색">
			</div>
			<div id = "line3">
				<label for = "p_noView">상품번호</label>
				<input type = "text" id = "p_noView" name = "p_noView" value="${adminVO.p_no }">
			</div>
		</div>
		<table id=  "slave">
			<colgroup>
				<col width="10%">
				<col width="5%">
				<col width="8%">
				<col width="7%">
				<col width="15%">
				<col width="9%">
				<col width="5%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="5%">
			</colgroup>
			<tr>
				<th>주문번호</th>
				<th>회원번호</th>
				<th>회원ID</th>
				<th>회원이름</th>
				<th>주문주소</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>결제가격</th>
				<th>결제방법</th>
				<th>주문날짜</th>
				<th>주문상태</th>
			</tr>
			<c:if test="${not empty orderList }">
				<c:forEach items="${orderList }" varStatus="status">
					<tr class = "hahaha">
						<td class = "o_num${orderList[status.index].o_num }" data-num = "${orderList[status.index].o_num }">
							${orderList[status.index].o_num } <input type = "button" class = "goF" value="확인">
						</td>
						<td class = "lightBorder">${orderList[status.index].m_no }</td>
						<td class = "o_no" data-num = "${orderList[status.index].o_no }" >${orderList[status.index].m_id }</td>
						<td>${orderList[status.index].m_name }</td>
						<td>${orderList[status.index].m_addr }</td>
						<td>${orderList[status.index].p_no }</td>
						<td>${orderList[status.index].o_cnt }</td>
						<td>${orderList[status.index].o_price }</td>
						<td>${orderList[status.index].o_mode }</td>
						<td>${orderList[status.index].o_date }</td>
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
					</tr>
				</c:forEach>
				<tr>
							<td colspan="11" class = "pageLow">
								<c:if test = "${adminVO.totalPage < adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.totalPage }"/>
								</c:if>
								<c:if test = "${adminVO.totalPage >= adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.pageNum }"/>
								</c:if>
							
								<c:if test = "${adminVO.pageTotal[0] eq 1 and pNum eq 1}" >
									<span class = "icon-angle-double-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] eq 1 and pNum ne 1}" >
									<a href = "/admin/policyAgr?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] - fn:length(adminVO.pageTotal) }" data-num = "${adminVO.pageTotal[0] - fn:length(adminVO.pageTotal) }" class = "icon-angle-left"></a>
								</c:if>
					
								<c:forEach items="${adminVO.pageTotal }" varStatus="status">
									<c:if test = "${adminVO.pageTotal[status.index] eq pNum}" >
										<span>${adminVO.pageTotal[status.index] }</span>
									</c:if>
									<c:if test = "${adminVO.pageTotal[status.index] ne pNum}" >
										<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[status.index] }" data-num = "${adminVO.pageTotal[status.index]}">
					 						${adminVO.pageTotal[status.index] } 
										</a>
									</c:if>
								</c:forEach>
	
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage}" >
									<span class = "icon-angle-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] + fn:length(adminVO.pageTotal) }" data-num = "${adminVO.pageTotal[0] + fn:length(adminVO.pageTotal) }" class = "icon-angle-right"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage and adminVO.totalPage eq pNum}" >
									<span class = "icon-angle-double-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage and adminVO.totalPage ne pNum}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.totalPage }" data-num = "${adminVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.totalPage }" data-num = "${adminVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
							</td>
						</tr>
			</c:if>
			<c:if test="${empty orderList }">
				<tr>
					<td colspan="11">데이터가 존재하지 않습니다.</td>
				</tr>
				<tr>
						<td colspan="11" class= "pageLow">
							<span class = "icon-angle-double-left"></span>
								<span class = "icon-angle-left"></span>
								<span>1</span>
								<span class = "icon-angle-right"></span>
								<span class = "icon-angle-double-right">
							</span>
						</td>
					</tr>
			</c:if>
		</table>
		<input type = "hidden" id = "m_id" name = "m_id" value="${adminVO.m_id }">
		<input type = "hidden" id = "m_name" name = "m_name" value="${adminVO.m_name }">
		<input type = "hidden" id = "p_no" name=  "p_no" value="${adminVO.p_no }">
		<input type = "hidden" id = "pageNum" name=  "pageNum" value="${adminVO.pageNum }">
		<input type = "hidden" id = "o_num" name = "o_num">
	</form>
</div>

<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type = "text/javascript">
	$(document).ready(function(){
		var loopGo = $(".hahaha").length;
		
		for(var i = 0; i < loopGo; i++){
			var test = $(".hahaha").eq(i).find("td").eq(0).attr("class");
			var test2 = $("."+test+"").length;
			if(test2 != 1){
				$(".hahaha").eq(i).find("td").eq(0).attr("rowspan", test2);
				$("."+test+"").not($("."+test+"").eq(0)).remove();
				i = i + test2 - 1;
			}	
			
		};
		
		$("#gogogogo").click(function(event){
			event.preventDefault();
			$("#m_id").val($("#m_idView").val());
			$("#m_name").val($("#m_nameView").val());
			$("#p_no").val($("#p_noView").val());
			$("#pageNum").val("");
			$("#searchForm").attr({
				"action" : "/admin/order/orderPaymentList",
				"method" : "post"
			});
			$("#searchForm").submit();
		});
		
		$(".pageLow a").click(function(event){
			event.preventDefault();
			var adminPageNum = $(this).attr("data-num");
			$("#pageNum").val(adminPageNum);
			$("#adminPageNum").val(adminPageNum);
			$("#searchForm").attr({
				"method" : "post",
				"action" : "/admin/order/orderPaymentList"
			});
			$("#searchForm").submit();
		});
		
		$(".goF").click(function(event){
			event.preventDefault();
			if(confirm("주문번호 : [" + $(this).closest("td").attr("data-num") + "] 정말로 하시겠습니까?")){
				$("#o_num").val(($(this).closest("td").attr("data-num")));
				$.ajax({
					url : "/admin/order/orderPaymentListY",
					data : $("#searchForm").serialize(),
					dataType : "text",
					type : "post",
					error : function(){
						alert("시스템 에러입니다.");
					},
					success : function(reslut){
						if(result = "success") location.reload();
						else alert("시스템 에러입니다.");
					}
				});
			}
		});	
	});
</script>