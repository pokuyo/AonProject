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

</style>
<div class = "main">
	<h2 id = "pTitle">거래 목록</h2>
	<form id = "searchForm">
		<div id = "searchLine">
			<label>날짜 검색</label>
			<input type = "date" id = "startDateView" name = "startDateView" value="${adminVO.startDate }">
			<input type = "date" id = "endDateView" name = "endDateView" value="${adminVO.endDate }">
			<input type = "button" id = "gogogogo" value="검색">
		</div>
		<table id=  "slave">
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="8%">
				<col width="7%">
				<col width="15%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
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
						<td class = "o_num${orderList[status.index].o_num }">${orderList[status.index].o_num }</td>
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
		<input type = "hidden" id = "startDate" name = "startDate" value="${adminVO.startDate }">
		<input type = "hidden" id = "endDate" name = "endDate" value="${adminVO.endDate }">
		<input type = "hidden" id = "pageNum" name=  "pageNum" value="${adminVO.pageNum }">
	</form>
</div>

<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type = "text/javascript">
	$(document).ready(function(){
		var loopGo = $(".hahaha").length;
		
		for(var i = 0; i < loopGo; i++){
			var test = $(".hahaha").eq(i).find("td").eq(0).attr("class");
			var test2 = $("."+test+"").length;
			if(test2 > 1){
				$(".hahaha").eq(i).find("td").eq(0).attr("rowspan", test2);
				$("."+test+"").not($("."+test+"").eq(0)).remove();
				i = i + test2 - 1;
			}	
			
		};
		
		$("#gogogogo").click(function(event){
			event.preventDefault();
			$("#startDate").val($("#startDateView").val());
			$("#endDate").val($("#endDateView").val());
			$("#pageNum").val("");
			$("#searchForm").attr({
				"action" : "/admin/order/orderList",
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
				"action" : "/admin/order/orderList"
			});
			$("#searchForm").submit();
		});
		
	});
</script>