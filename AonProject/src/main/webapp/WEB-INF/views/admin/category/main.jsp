<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/custom.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/admincategory.css">
	
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cainsertBtn").click(function(){
			var name = $("#ca_name").val();
			var caselect = $("#caselect option:selected").text();
			var ca_name = name+" "+caselect;
			if(!chkSubmit($("#ca_name"),"연도를 입력해주세요(ex:2017)"))return;
			else{
				if(confirm("입력하시겠습니까?")){
					$(this).parent().click();
				}else{
					return false;
				}
				console.log(ca_name);
				$.ajax({
					url:"/admin/categoryInsert",
					type:"post",
					dataType:"text",
					data:"ca_name="+ca_name,
					error:function(){
						alert("시스템 오류입니다. 관리지에게  문의해주세요.");
					},
					success:function(result){
						if(result == "success"){   
							alert("입력 완료했습니다.");
							location.reload();   
						}
					}
				});
			}
		});
		
		//숫자만 입력받기 근데 한글은 적용이 안된다.
		$('#ca_name').keypress(function (event) { 
			if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { 
				event.preventDefault(); 
				} 
			});
		
		$(".ca_name2").hide();
		
		//수정
		$(".caUpdateBtn").click(function(){
				$(this).parents("td").children(".ca_name1").hide();
				$(this).parents(".caBtn").hide();
				$(this).parents("td").children(".ca_name2").show();
		});
		
		//수정할 때 확인 버튼.
		$(".caokBtn").click(function(){
			var ca_no = $(this).parents("td").children(".ca_no").val();
			var caname = $(this).parents("td").children().find("#ca_name").val();
			var caselect = $(this).parents("td").children().find("#caselect option:selected").text();
			var ca_name = caname+" "+caselect;
			/* if(!chkSubmit($(caname),"연도를 입력해주세요(ex:2017)"))return; */
			if(confirm("수정하시겠습니까?")){
				$(this).parent().click();
			}else{
				return false;
			}
			$.ajax({
				url:"/admin/caUpdate",
				type:"post",
				data:"ca_no="+ca_no+"&ca_name="+ca_name,
				dataType:"text",
				error:function(){
					alert("시스템오류입니다. 관리자에게 문의하세요.");
				},
				success:function(result){
					if(result=="success"){
						alert("수정에 성공했습니다.")
						location.reload();
					}
				}
			});
		});
		
		$(".cacancelBtn").click(function(){
			$(this).parents(".ca_name2").hide();
			$(this).parents("td").children(".ca_name1").show();
			$(this).parents("td").children(".caBtn").show();
		});
		
		//삭제버튼
		$(".caDeleteBtn").click(function(){
			var ca_no = $(this).parents("td").children(".ca_no");
			if(confirm("삭제하시겠습니까?")){
				$(this).parents().click();
			}else{
				return false;
			}
			$.ajax({
				url:"/admin/caDelete",
				data:"ca_no="+ca_no.val(),
				type:"post",
				dataType:"text",
				error:function(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				},
				success:function(result){
					if(result == "success"){
						alert("삭제되었습니다.");
						location.reload();
					}
				}
			});
		});
	});

</script>
	<div class="category-Insert">
		<div class="ca_top"><h1>카테고리 입력</h1></div>
		<form id="ca_insertForm">
			<table>
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<tr>
					<td>카테고리 이름 : </td>
					<td>
						<input type="text" id="ca_name" name="ca_name" size="8" maxlength="4" placeholder="ex)2017" />
						<select id="caselect" name="caselect">
							<option value="caoption1">S/S</option>
							<option value="caoption2">F/W</option>
						</select>
					</td>
				</tr>
				<tr class="catr2">
					<td colspan="2">
						<input type="reset" id="cacancelBtn" class="btn btn-danger" value="취소">
						<input type="button" id="cainsertBtn" class="btn btn-primary" value="등록">
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="caList">
		<table>
			<tbody>
				<tr>
					<th>NAME</th>
				</tr>
				<c:choose>
					<c:when test="${not empty categoryList}">
						<c:forEach var="category" items="${categoryList}">
							<c:if test="${category.ca_confirm == 'N' }">
							<tr>
								<td colspan="2"> 
									<input type="hidden" class="ca_no" value="${category.ca_no }">
									<div class="ca_name1">${category.ca_name}</div>
									<div class="ca_name2">
										<input type="number" id="ca_name" name="ca_name" size="8" maxlength="4" placeholder="ex)2017">
										<select id="caselect" name="caselect">
											<option value="caoption1">S/S</option>
											<option value="caoption2">F/W</option>
										</select>
										<input type="button" class="caokBtn btn btn-primary" value="확인">
										<input type="button" class="cacancelBtn btn btn-danger" value="취소">
									</div>
									<div class="caBtn" style="float:right">
										<input type="button" class="caUpdateBtn btn btn-primary" value="수정">
										<input type="button" class="caDeleteBtn btn btn-danger" value="삭제">	
									</div>	
								</td>
							</tr>
							</c:if>	
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>등록된 카테고리 없음</p>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
				