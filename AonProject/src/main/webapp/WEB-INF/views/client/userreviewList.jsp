<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/review/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/review/reviewuser.css">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		var status = "off";
		var replyNum="작성시 입력한 비밀번호를 입력해 주세요.";
		var gfv_count = 1;
		
		$(function(){
			$(".find_review").find("td").hide(); //이벤트가 발생된 대상의 자식요소 검색 find()
			
			//제목을 클릭했을 때
			$(".review_tr").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".review_tr").not(this).next("tr").children("td");
				
				showData.slideToggle(300);
				hideData.slideUp(300);	
				$(".review_write").hide();
				rollBack();
				return false;
	           
			}); 
			
			//글 입력폼띄우기
			$(".review_write").hide();
			$(".write_button").click(function(){
				var p_no = $(this).children(".p_no").val();	
				$.ajax({
					url:"/review/reviewOrderConfirm",
					type:"post",
					dataType:"text",
					data: "p_no="+p_no,
					error:function(){
						alert("시스템 오류입니다. 관리자에게 문의하세요.");
					},
					success:function(result){
						if(result == "success"){
							$(".review_write").show();
							$(".find_review").find("td").hide();
							rollBack();
						}else if(result == "fail"){
							alert("상품주문 후에 작성하실 수 있습니다.");
						}else if(result = "fails"){
							alert("이미 주문한 상품에대해 리뷰를 작성하였습니다. 다른 의견 작성은 문의 게시판을 이용해주세요.")
						}
					}
				});
			});
			
			//write버튼을 클릭했을 때 입력
			$(".write_btn").click(function(){
				var wirteForm = $("#write_form");
				var files = $("#write_form").children().find("#files");
				if(!chkSubmit($("#re_title"),"제목을"))return;
				else if(!chkSubmit($("#re_pwd"),"비밀번호를"))return;
				else if(!chkSubmit($("#re_content"),"내용을"))return;
				/* else if(!chkFile($("#files"),"첨부파일 입력해서요.(이미지 파일만 등록가능합니다.)"))return; */
				else{
					if($(files).val()==""){
						$.ajax({
							url:"/review/reviewUserInsert",
							dataType:"text",
							data :$(wirteForm).serialize(),
							type:"post",
							error:function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success:function(result){
								if(result == "success"){
									alert("글이 등록되었습니다.")
									location.reload();
								}else if(result == "fail"){
									alert("이미 review를 작성하셨습니다. 다른 의견은 문의게시판의나 전화문의 부탁드립니다.");
									rollBack();
									$(".review_write").hide();
								}
							}
						});
					}
					else if($("wirteForm  #files").val()!=""){
						$(wirteForm).ajaxForm({
							url:"/review/reviewuserInsert",
							enctype: "multipart/form-data",
							dataType : "text",
							type:"post",
							error:function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success:function(result){
								if(result == "success"){
									alert("글이 등록되었습니다.")
									location.reload();
								}else if(result == "fail"){
									alert("이미 review를 작성하셨습니다. 다른 의견은 문의게시판의나 전화문의 부탁드립니다.");
									rollBack();
									$(".review_write").hide();
								}
							}
						});
						$(wirteForm).submit();
					}
				}
			});
			
			
			//update_content숨겨놓기
			$(".update_content").hide();
			$(".pwdChk").hide();
			//content_modify를 클릭했을 때(review수정)
			$(".content_modify").click(function(){
				$(this).parents("td").children(".content").hide();
				$(this).parents("td").children(".content_modify").hide();
				$(this).next(".pwdChk").show();
			});
			
			//delete_mobtn버튼을 클릭했을 때
			$(".delete_mobtn").click(function(){
				rollBack();
			});
			
			//비밀번호 확인 버튼 클릭시 실질적인 처리 함수
			$(document).on("click", ".pwdBtn", function(){
				var re_pwd = $(this).parents(".pwdChk").children(".ree_pwd");
				var msg = $(this).next(".msg");
				var re_no = $(this).parents(".pwdChk").children(".re_no");
				var pwdChk = $(this).parents(".pwdChk"); //비밀번호 확인 div
				var update_content = $(this).parents("td").children(".update_content"); //update구간이 띄워질 곳
				var content_modify = $(this).parents("td").children(".content_modify"); //맨처음 보이는 modify버튼
				var content = $(this).parents("td").children(".content"); //원래 내용
				
				if(!chkSubmit($(re_pwd),"비밀번호를"))return;
				else{
					$.ajax({
						url:"/review/reviewConfirm",
						type:"POST",
						data:"re_no="+re_no.val()+"&re_pwd="+re_pwd.val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(resultData){
							if(resultData==0){
								msg.addClass("msg-error");
								msg.text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
							}else if(resultData==1){
								console.log("resultData = " +resultData);
								content.hide();
								content_modify.hide();
								pwdChk.hide();
								update_content.show();
								
							}
						}
					});
				}
			});
			
			//$(".update_mobtn")클릭시 업뎃
			$(".update_mobtn").click(function(){
				var tr = $(this).parents("tr");
				var Btn = $(this).parents(".update_content").next(".content_modify");
				var update_form = $(this).parents("#update_form");
				var re_content = $(this).parents("#update_form").children("#re_content");
				var re_no = $(this).parents("tr").attr("data-no");
				var re_file=$(this).parents("#update_form").children().find("#files");
				var content = $(this).parents("td").children(".content"); //원래 내용
				if(!chkSubmit($(re_content),"내용을")) return;
				else{
					if($(re_file).val()==""){
						$.ajax({
							url:"/review/reviewUserUpdate",
							dataType:"text",
							data :$(update_form).serialize(),
							type:"post",
							error:function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success:function(result){
								if(result == "success"){
									alert("글이 수정되었습니다.")
									location.reload();
								}
							}
						});
					}
					else if($(re_file).val()!=""){
						
						$(update_form).ajaxForm({
							url:"/review/reviewuserUpdate",
							type:"post",
							enctype:"multipart/form-data",
							error:function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요.");
							},
							success:function(result){
								if(result == "success"){
									alert("글이 수정되었습니다.");
									location.reload();
								}
							}
						});
						$(update_form).submit();	
					}
				}
			});
			
			$("#files").on('change', function(){
                readURL(this);
            });
		});
		    
		//취소 
		function rollBack(){
			$(".update_content").hide();
			$(".content").show();
			$(".content_modify").show();
			$(".ree_pwd").val("");
			$("#write_form input[type='text']").val("");
			$("input[type='password']").val("");
			$("#write_form textarea").val("");
		}
		 
	</script>
<div id="m_review">
		<div id="pro_info_s3">
			<div class="board-hd">
				<img id="review" src="/resources/include/image/reviewimage/tit_review.gif">
			</div>
		</div>
		<div class="reviewTopBtn">
			<a class="board_btns" href="#">
				ALL VIEW
			</a>
			<sec:authorize access="hasRole('user')">
				<div class="write_button">
					WRITE
					<input type="hidden" class="p_no" name="p_no" value="${param.no }">
				</div>
			</sec:authorize>
			<sec:authorize ifNotGranted="user">
				<div class="warning">
					<span>회원로그인 후 작성할 수 있습니다.</span>
				</div>
			</sec:authorize>
		</div>
		<sec:authorize access="hasRole('user')">
		<!-- write작성 폼 -->
		<div class="review_write">
			<form id="write_form">
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
								<div class="tb-left frm-w"><input type="text" name="re_title" id="re_title" size="40" maxlength="20"></div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">비밀번호 : </div></th>
							<td>
								<div class="tb-left frm-w">
									<input type="password" name="re_pwd" id="re_pwd" size="20" maxlength="20">
									<span style="color:red;">비밀번호는 자동 저장됩니다.</span>
								</div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">내용 : </div></th>
							<td>
								<div class="tb-left frm-w">
									<textarea rows="8" cols="70" id="re_content" name="re_content" maxlength="3000" style="resize: none;"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th class="tb-left frm-w">첨부파일 : </th>
							<td>
								<div class="file_div">
									<input type="file" id="files" name="files" multiple><br>
								</div>
								<div class="write_btn" style="cursor: pointer;">
									<img src="/resources/include/image/reviewimage/write_review.gif" >
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		</sec:authorize>
		<!-- 리뷰 뜨는 곳 -->
		<form id="review_detail" name="review_detail">
			<input type="hidden" id="re_no" name="re_no">
		</form>
		<div class="table-slide review-list">
			<table>
				<colgroup>
					<col width="10%">
					<col width="64%">
					<col width="12%">
					<col width="14%">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="tb_board">번호</div>
						</th>
						<th>
							<div class="tb_board">제목</div>
						</th>
						<th>
							<div class="tb_board">작성자</div>
						</th>
						<th>
							<div class="tb_board">등록일</div>
						</th>
					</tr>
				</thead>
				<tbody id="retbody">
					<c:choose>
						<c:when test="${not empty reviewuserList }">
							<c:forEach var="review" items="${reviewuserList }">
								<tr data-num="${review.re_no }" class="review_tr">
									<td>${review.re_no }</td>
									<td class="goDetail">
										${review.re_title }
										<c:forEach items="${review.re_chk }">
											<c:if test="${review.re_chk == 1 }">
												(<label style="color:red">답변완료</label>)
											</c:if>
										</c:forEach>
									</td>
									<td class="name">${review.re_name }님</td>
									<td>${review.re_date }</td>
								</tr>
								<tr class="find_review" data-no="${review.re_no }">
									<td colspan="4">
									
										<div class="content">
											-review : ${review.re_content }
											<div class="reviewImg">
												<c:if test="${not empty reviewImgList }">
														<c:forEach var="reviewImg" items="${reviewImgList}">
															<c:if test="${review.re_no eq reviewImg.re_no }">
																<img src="/reviewFileUpload/${reviewImg.ri_file }" style="width:105px; height:75px;">
															</c:if>
														</c:forEach>
												</c:if>
											</div>
										</div>
										<div class="update_content">
											<form id="update_form">
												<input type="hidden" name="re_no" id="re_no" value="${review.re_no }">
												<textarea rows="8" cols="70" id="re_content" name="re_content" maxlength="3000">${review.re_content }</textarea>
												<div class="mo_file"> 
													<input type="file" id="files" name="files" style="padding-top:8px;" multiple><br />
													<div class="imgView" style="padding-top:14px;">
														<span style="color:red;">기존 이미지 파일 : </span><br />
														<div class="reviewImg">
															<c:if test="${not empty reviewImgList }">
																<c:forEach var="reviewImg" items="${reviewImgList}">
																	<c:if test="${review.re_no eq reviewImg.re_no }">
																		<img src="/reviewFileUpload/${reviewImg.ri_file }">
																	</c:if>
																</c:forEach>
															</c:if>
														</div>
														<span class="imgArea"></span>
													</div>
												</div>
												<!-- <div class="modify_addFile">
													<a href="#this" class="btn" id="addFile">파일 추가</a>
												</div><br> -->
												<div class="update_mobtn">modify</div>
												<div class="delete_mobtn">cancel</div>
											</form>
										</div>
										<sec:authorize access="hasRole('user')">
											<div class="content_modify">modify</div>
										</sec:authorize>
										<sec:authorize ifNotGranted="user">
											<div class="warning_modify">
												<span style="padding:0 0 0 10px;">회원로그인 후 수정할 수 있습니다.</span>
											</div>
										</sec:authorize>
										
										<%--==========비밀번호 확인 버튼 및 버튼 추가 시작======== --%>
										<div class="pwdChk">
											<input type="hidden" name="re_no" class="re_no" value="${review.re_no }">
											<label for="r_pwd" class="l_pwd">비밀번호 : </label>
											<input type="password" name="ree_pwd" class="ree_pwd">
											
											<input type="button" class="pwdBtn" value="확인">
											<span class="msg"></span>
										</div>
										
										<!-- 관리자 코멘트가 시작되는 구간 -->
										<div class="comment-list">
											<h3>COMMENT</h3>
											<div class="comment-cover">
												<div class="comment-content">
													<div class="content-top">
														<c:if test="${not empty recommentList }">
															<c:forEach items="${recommentList }" var="recomment">
																<c:if test="${review.re_no eq recomment.re_no }">
																	<div class="name">AON <span class="date">${recomment.com_date }</span></div>
																	
																</c:if>
															</c:forEach>
														</c:if>
														<div class="commentp">
															<span class="c-content">
															<c:if test="${not empty recommentList }">
																<c:forEach items="${recommentList }" var="recomment">
																	<c:if test="${review.re_no eq recomment.re_no }">
																		${recomment.com_content }
																	</c:if>
																</c:forEach>
															</c:if>
															</span>	
														</div>					
													</div>
												</div>
												
												<!-- 회원 로그인 시 없어질 구간 -->
												<sec:authorize ifNotGranted="user">	
													<div class="comment-write">
														<div class="comment-p">
															<p style="color:#999;font-size:11px">( 회원 로그인이 필요한 기능입니다 )</p>
														</div>	
													</div>
												</sec:authorize>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" style="border-bottom: 1px solid #bdbdbd; border-top: 1px solid #bdbdbd; color: #777;">
									<div class="tb-center">등록된 리뷰가 없습니다.</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>