<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel="stylesheet" type="text/css" href="/resources/include/css/qna/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/qna/qnauser.css">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".qna_tr2").find("td").hide();
			$(".qna_tr4").find("td").hide();
			$(".qna_tr1").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".qna_tr1").not(this).next("tr").children("td");
				
				showData.slideToggle(200);
				hideData.slideUp(200);
				qnaBack();
				qnaRollback();
				return false;
			});
			$(".qna_tr3").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".qna_tr3").not(this).next("tr").children("td");
				
				showData.slideToggle(200);
				hideData.slideUp(200);	
				qnaBack();
				qnaRollback();
				return false;
			});
			
			//qna_write
			$(".qna_write").hide();
			
			//qnawrite_button
			$(".qnawrite_button").click(function(){
				$(".qna_write").show();
				$(".review_write").hide();
			});
			
			//입력
			$(".qnawrite_btn").click(function(){
				var qnawriteform = $("#qnawrite_form");
				var files = $("#qnawrite_form").children().find("#files");
				if(!chkSubmit($("#q_pwd"),"비밀번호를"))return;
				else if(!chkSubmit($("#q_content"),"내용을"))return;
				else{
					$.ajax({
						url:"/qna/qnaUserInsert",
						dataType:"text",
						data :$(qnawriteform).serialize(),
						type:"post",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							if(result == "success"){
								alert("글이 등록되었습니다.")
								location.reload();
								
							}
						}
					})
				}
			});
			
			//비밀번호 확인
			$(".qnaContent").hide();
			$(".cq_content").hide();
			
			$(document).on("click",".qna_pwdBtn", function(){
				var q_pwd = $(this).parents(".qnapwdChk").children(".q_pwd");
				var q_no = $(this).parents(".qnapwdChk").children(".q_no");
				var qnapwdChk = $(this).parents(".qnapwdChk");
				var qnaContent = $(this).parents(".qnapwdChk").next(".qnaContent");
				var userqnacontent = $(this).parents(".user_qnacontent").children(".secret");
				var msg = $(this).next("span")
				if(!chkSubmit($(q_pwd),"비밀번호를"))return;
				else{
					$.ajax({
						url:"/qna/qnaPwdConfirm",
						type:"post",
						data:"q_no="+q_no.val()+"&q_pwd="+q_pwd.val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							if(result==0){
								msg.addClass("msg-error");
								msg.text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
							}else if(result == 1){
								alert("확인되었습니다.");
								qnapwdChk.hide();
								qnaContent.show();
								userqnacontent.hide();
							}
						}
					})
				}
			});	
			
			//관리자 코멘트 보기위한 비밀번호 확인.
			$(document).on("click",".cqna_pwdBtn", function(){
				var q_pwd = $(this).parents(".cqnapwdChk").children(".q_pwd");
				var q_no = $(this).parents(".cqnapwdChk").children(".q_no");
				var cqnapwdChk = $(this).parents(".cqnapwdChk");
				var qnaContent = $(this).parents(".cqnapwdChk").next(".cq_content");
				var showComment = $(this).parents(".showComment").children(".secret");
				var msg = $(this).next("span")
				if(!chkSubmit($(q_pwd),"비밀번호를"))return;
				else{
					$.ajax({
						url:"/qna/qnaPwdConfirm",
						type:"post",
						data:"q_no="+q_no.val()+"&q_pwd="+q_pwd.val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							if(result==0){
								msg.addClass("msg-error");
								msg.text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
							}else if(result == 1){
								alert("확인되었습니다.");
								cqnapwdChk.hide();
								qnaContent.show();
								showComment.hide();
							}
						}
					})
				}
			});	
		});
			
		
		//취소 
		function qnaBack(){
			$("input[type='password']").val("");
			$("#qnawrite_form textarea").val("");
		}
		function qnaRollback(){
			$(".qnapwdChk").show();
			$(".secret").show();
			$(".cqnapwdChk").show();
			$(".cq_content").hide();
			$(".qnaContent").hide();
		}
		
	</script>
<div id="qnabody">
	<div class="qna_top">
		<div class="qna_hd">
			<span>QnA</span> <label>BOARD</label>
		</div>
	</div>
	
	<div class="qna_topBtn" style="padding: 0 5px 8px;">
		<a href="#" class="all_btns">
			ALL VIEW
		</a>
		<sec:authorize access="hasRole('user')">
			<div class="qnawrite_button">
				WRITE
			</div>
		</sec:authorize>
		<sec:authorize ifNotGranted="user">
				<div class="warning">
					<span>회원로그인 후 작성할 수 있습니다.</span>
				</div>
			</sec:authorize>
	</div>
		<!-- write작성 폼 -->
		<div class="qna_write">
			<form id="qnawrite_form">
			<input type="hidden" name="p_no" value="${param.no }">
				<table>	
					<colgroup>
						<col width="15%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<div class="tb-left">제목 : </div>
							</th>
							<td>
								<div class="tb-left frm-w">
									<input type="text" disabled="disabled" value="문의합니다.">
									<input type="hidden" name="q_title" id="q_title" value="문의합니다.">
								</div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">비밀번호 : </div></th>
							<td>
								<div class="tb-left frm-w">
									<input type="password" name="q_pwd" id="q_pwd" size="20" maxlength="20">
									<font color="red">자동 잠금 기능</font>
								</div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">내용 : </div></th>
							<td>
								<div class="tb-left frm-w">
									<textarea rows="8" cols="70" id="q_content" name="q_content" maxlength="3000" style="resize: none;"></textarea>
								</div>
								
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="qnawrite_btn" style="cursor: pointer;" style="float:right;">
									<img src="/resources/include/image/reviewimage/write_review.gif" >
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	
	
	<!-- 문의관리 -->
	<div class="qna-table-list">
		<table summary="QnAboard">
			<caption>일반게시판 게시글</caption>
				<colgroup>
                   <col width="60">
                   <!-- .상품정보가 있을 경우에만 나타남 -->
                   <col width="*">
                   <col width="130">
                   <col width="130">
               </colgroup>
               <thead>
               		<tr>
                       <th scope="col"><div class="tb-center">No.</div></th>
                       <th scope="col"><div class="tb-center">Content</div></th>
                       <th scope="col"><div class="tb-center">Name</div></th>
                       <th scope="col"><div class="tb-center">Date</div></th>
                   	</tr>
               </thead>
               <tbody>
               		<tr>
                       <td>
                       		<div class="tb-center">
                       			<img src="/resources/include/image/qnaimage/icon_box_arrow.gif" >
                       			<img src="/resources/include/image/qnaimage/neo_notice.gif" >
                       		</div>
                       </td>
                       <!-- .상품정보가 있을 경우에만 나타남 -->
                       <td>
                          <div class="tb-center">
                               <a href="#"><font color="#000000"><b>- 비방/욕설/가격비교/홍보/영업방해/게시판과 맞지않는 글은 무통보 삭제합니다 -</b></font></a>                                                                                                                    
                     	  </div>
                       </td>
                       <td>
                           <div class="tb-center">
                               	작성자
                           </div>
                       </td>
                       <td><div class="tb-center">등록일</div></td>
                   </tr>
                   <c:choose>
                   		<c:when test="${not empty qnaList }">
							<c:forEach items="${qnaList }" var="qna">
								<tr data-num="${qna.q_no }" class="qna_tr1">
									<td>
										<div class="tb-center">${qna.q_no }
										</div>
									</td>
									<td>
										<div class="tb-center">${qna.q_title }
											<c:forEach items="${qna.q_confirm }">
												<c:if test="${qna.q_confirm==1 }">
													(<label style="color:red">문의 답변 완료</label>)
												</c:if>
												<c:if test="${qna.q_confirm==0 }">
													(<label style="color:red">답변 대기</label>)
												</c:if>
											</c:forEach>										
										</div>
									</td>
									<td><div class="tb-center">${qna.q_name }***</div></td>
									<td><div class="tb-center">${qna.q_date }</div></td>
								</tr>
								<tr class="qna_tr2">
									<td colspan="4">
										<div class="user_qnacontent">
											<%--==========비밀번호 확인 버튼 및 버튼 추가 시작======== --%>
											<div class="secret" style="padding: 20px 20px 0 30px;">
												이 글은 비밀글입니다. <br>
												비밀번호를 입력하여 주세요.
											</div>
											<div class="qnapwdChk">
												<input type="hidden" name="q_no" class="q_no" value="${qna.q_no }">
												<label for="q_pwd" class="l_pwd">비밀번호 : </label>
												<input type="password" name="q_pwd" class="q_pwd" maxlength="20">
												
												<input type="button" class="qna_pwdBtn" value="확인">
												<span class="msg"></span>
											</div>
											
											<div class="qnaContent">
												<span class="qna_content">-QnA : ${qna.q_content }</span>
											</div>
										</div>
									</td>
								</tr>
								<tr class="qna_tr3">
									<c:if test="${not empty commentQnAList }">
										<c:forEach items="${commentQnAList }" var="commentQnA">
											<c:if test="${qna.q_no eq commentQnA.q_no }">
												<td><div class="tb-center">
														<img src="/resources/include/image/qnaimage/neo_lock.gif" >
													</div>
												</td>
												<td><div class="tb-center"><img src="/resources/include/image/qnaimage/neo_reply.gif" >&nbsp;비밀글입니다.</div></td>
												<td><div class="tb-center">AON관리자</div></td>
												<td><div class="tb-center">${commentQnA.cq_date }</div></td>
											</c:if>
										</c:forEach>
									</c:if>
								</tr>
								<tr class="qna_tr4" data-no="${qna.q_no }">
									<td colspan="4">
										<div class="comment-list">
											<h3>COMMENT LIST</h3>
											<div class="comment-cover">
												<div class="showComment">
													<c:if test="${not empty commentQnAList }">
														<c:forEach items="${commentQnAList }" var="commentQnA">
															<c:if test="${commentQnA.q_no eq qna.q_no}">
																<%--==========비밀번호 확인 버튼 및 버튼 추가 시작======== --%>
																<div class="secret" style="padding: 20px 20px 0 0;">
																	이 글은 비밀글입니다. <br>
																	비밀번호를 입력하여 주세요.
																</div>
																<div class="cqnapwdChk">
																	<input type="hidden" name="q_no" class="q_no" value="${qna.q_no }">
																	<label for="q_pwd" class="l_pwd">비밀번호 : </label>
																	<input type="password" name="q_pwd" class="q_pwd">
																	
																	<input type="button" class="cqna_pwdBtn" value="확인">
																	<span class="msg"></span>
																</div>
																
																<div class="cq_content">
																	<div style="color:#BDBDBD">AON&nbsp;&nbsp;&nbsp; ${commentQnA.cq_date }</div>
																	<div class="cq_Showcontent" style="padding-top:10px;">
																		${commentQnA.cq_content }	
																	</div>
																</div>
															</c:if>
														</c:forEach>
													</c:if>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">
									<div class="tb-center">등록된 문의가 없습니다.</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>	
               </tbody>
		</table>
	</div>
</div>