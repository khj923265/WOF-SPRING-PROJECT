<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	

 <script src="https://code.$.com/$-latest.min.js" type="application/javascript"></script>
  <script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
	 
	<!-- Header -->
	<%@ include file="../includes/header.jsp" %>


	<!-- Main content -->
	<div class="main-content" id="panel">
	<form action="/project/create" method="post" >
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-5" style="margin-left: 80px;">



								<div class="form-group">
									<label for="projectname" style="font-weight: bold;">프로젝트명 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_title" class="form-control" id="proj_title"
										placeholder="Enter project name" required>
								</div>


								<div class="form-group">
									<label style="font-weight: bold;">프로젝트 모집기간 <span class="required" style="color: #CE3861;">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="date" name="proj_apply_start"
												class="form-control" required></span>
										</div>
										~
										<div class="col">
											<span><input type="date" name="proj_apply_deadline"
												class="form-control" required></span>
										</div>
										
									</div>
									<!-- end row -->
								</div>


								<div class="form-group">
									<label style="font-weight: bold;">프로젝트 수행기간 <span class="required" style="color: #CE3861;">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="date" name="proj_start_date" id="proj_start_date"
												class="form-control" required></span>
										</div>
										~
										<div class="col">
											<span><input type="date" name="proj_end_date" id="proj_end_date"
												class="form-control" required></span>
										</div>
										
										<div class="col" >
											<div id="cal_date" name="cal_date" ></div>
										</div>
										<div class="col">
											<span class="input_add" style="padding-left: 10px;"><input
												type="checkbox" id="cntiPlanYn" name="cntiPlanYn" value="Y">
												<label for="cntiPlanYn">연장가능</label></span>
										</div>
									</div>
									<!-- end row -->
								</div>

								<div class="form-group">
									<label for="project-budget" style="font-weight: bold;">프로젝트 예상금액 
									<span class="required" style="color: #CE3861;">*</span></label>
									<div class="row">
										<div class="col">
											<span><input type="text" name="proj_estimate"
												class="form-control" placeholder="100,000" required></span>
										</div>
										<div class="col">
											<span>원</span>
										</div>
										<div class="col">
											<span class="input_add" style="padding-left: 10px;">
											<input	type="checkbox" id="negoYn" name="negoYn" value="Y">
											<label for="negoYn">협의가능</label></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
											<span class="input_add"><input	type="checkbox" id="travelExpYn" name="travelExpYn"	value="Y">
											<label for="travelExpYn">출장비포함</label></span>
										</div>
									</div><!-- end row -->
									
								</div>

								<div class="form-group">
									<label for="exampleFormControlSelect1" style="font-weight: bold;">프로젝트 필요인원
									 <span	class="required" style="color: #CE3861;">*</span></label>
										 <select class="form-control"
										name="proj_reqr_person" required>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
										<option>13</option>
										<option>14</option>
										<option>15</option>
										<option>16</option>
										<option>17</option>
										<option>18</option>
										<option>19</option>
										<option>20</option>
										<option>21</option>
										<option>22</option>
									</select>
								</div>
				
				
				<div class="form-group">			
				<label style="font-weight: bold;">프로젝트 카테고리 <span class="required" style="color: #CE3861;">*</span></label>
				<p style="font-size: 12px;">해당하는 프로젝트 카테고리를 모두 선택해 주세요.</p>
					<div class="row">
					
					<div class="col-xl-2">		
					<div class="select-card client-input">
					<input id="category_develop" name="proj_reqr_skill" type="checkbox"  value="개발">
					<label class="input-replacer" for="category_develop"></label>
					<div class="select-card-content">
					<img class="select-card-img inherit-select-card-img" src="/resources/template/assets/img/icons/develop.png" style="height:100px; width:100px;">
					<!-- <img class="select-card-img active-select-card-img" src="/resources/template/assets/img/icons/design.png"> -->
					<p class="body-2-medium">개발</p>
					</div>
					</div>
					</div>
					
					<div class="col-xl-2" style="margin-left: 80px;">	
					<div class="select-card client-input ">
					<input id="category_design" name="proj_reqr_skill" type="checkbox" value="디자인">
					<label class="input-replacer" for="category_design"></label>
					<div class="select-card-content">
					<img class="select-card-img inherit-select-card-img"  src="/resources/template/assets/img/icons/design.png" style="height:100px; width:100px;">
					<!-- <img class="select-card-img active-select-card-img" src="/resources/template/assets/img/icons/design.png"> -->
					<p class="body-2-medium">디자인</p>
					</div>
					</div>
					</div>
					
					<div class="col-xl-2"  style="margin-left: 80px;">
					<div class="select-card client-input">
					<input id="category_plan" name="proj_reqr_skill" type="checkbox" value="기획">
					<label class="input-replacer" for="category_plan"></label>
					<div class="select-card-content">
					<img class="select-card-img inherit-select-card-img" src="/resources/template/assets/img/icons/plan.png" style="height:100px; width:100px;">
					<!-- <img class="select-card-img active-select-card-img" src="/resources/template/assets/img/icons/design.png"> -->
					<p class="body-2-medium">기획</p>
					</div>
					</div>
					</div>
							
					</div>





										<div class="form-group" id="subcategory_input_group"
											style="display: block;">
											<label class="form-group-title body-1-bold"
												style="font-weight: bold;">프로젝트 분야 <span
												class="required" style="color: #CE3861;">*</span></label>
											<div class="form-content">
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="웹">
														 <span>#웹</span></label></span> <span><label
													class="chip-choice-client" style="display: inline-block;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="애플리케이션">
														<span>#애플리케이션</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="커머스,쇼핑몰"> <span>#커머스,
															쇼핑몰</span></label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="일반 소프트웨어"> <span>#일반
															소프트웨어</span></label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="퍼블리싱"> <span>#퍼블리싱</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="워드프레스"> <span>#워드프레스</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="임베디드"> <span>#임베디드</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="제품"> <span>#제품</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="프레젠테이션"> <span>#프레젠테이션</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="그래픽"> <span>#그래픽</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="인쇄물"> <span>#인쇄물</span></label></span> <span><label
													class="chip-choice-client" style="display: none;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="로고"> <span>#로고</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="영상"> <span>#영상</span></label></span> <span><label
													class="chip-choice-client" style="display: inline-block;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="게임"> <span>#게임</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="기타"> <span>#기타</span></label></span>
											</div>
										</div>


								<div class="form-group" id="subcategory_input_group"
											style="display: block;">
											<label class="form-group-title body-1-bold"
												style="font-weight: bold;">프로젝트 전문기술 <span
												class="required" style="color: #CE3861;">*</span></label>
											<div class="form-content">
											
											
											<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Bash">
														 <span>Bash</span></label></span> <span><label
													class="chip-choice-client" style="display: inline-block;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="C/C++/C#">
														<span>C/C++/C#</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Java"> <span>Java</span></label></span> 
														<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="JavaScript"> <span>JavaScript</span></label></span>
														 <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Swift"> <span>Swift</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Perl"> <span>Perl</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Ruby"> <span>Ruby</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Python"> <span>Python</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="PHP"> <span>PHP</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="R"> <span>R</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="VBA"> <span>VBA</span></label></span> <span><label
													class="chip-choice-client" style="display: none;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="Scala"> <span>Scala</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="Go"> <span>Go</span></label></span>
											</div>
										</div>
											
											
											
											



									</div><!-- col-xl-5 -->
					</div>


							<div class="col-xl-5" style="margin-left: 80px;">
								<div class="form-group">
									<label for="exampleFormControlSelect1" style="font-weight: bold;">프로젝트 진행상태 
									<span	class="required" style="color: #CE3861;">*</span></label>
										 <select class="form-control"
										name="proj_type" required>
										<option value="0">아이디어만 있습니다</option>
										<option value="1">기획 중입니다</option>
										<option value="2">진행 중입니다</option>
									</select>
								</div>

								<div class="form-group">
									<label for="recurit-condition" style="font-weight: bold;">모집요건
									 <span	class="required" style="color: #CE3861;">*</span></label> <input type="text"
										name="proj_career" class="form-control"
										placeholder="ex)자바 경력 3년 이상" required>
								</div>


								<div class="form-group">
									<label for="project-manager" style="font-weight: bold;">PM유무
									 <span	class="required" style="color: #CE3861;">*</span></label>
									<div class="custom-control custom-radio mb-3">
										<input type="radio" id="customRadio1" name="proj_pm"
											class="custom-control-input" value="0" required checked="checked"> <label
											class="custom-control-label" for="customRadio1">유</label>
									</div>
									<div class="custom-control custom-radio">
										<input type="radio" id="customRadio2" name="proj_pm"
											class="custom-control-input" value="1" required> <label
											class="custom-control-label" for="customRadio2">무</label>
									</div>
								</div>

							
							

								

								<div class="form-group">
									<label for="working_status" style="font-weight: bold;">근무형태 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_work_type" class="form-control"
										placeholder="0자택 1 회사" required>
								</div>


								<div class="form-group">
									<label for="working_area" style="font-weight: bold;">근무지역 <span class="required" style="color: #CE3861;">*</span></label>
									
										<div class="row my-3 pt-3 inline clearfix">
                                        <div class="col-6 col-md-2 pr-0 text-right align-self-center">주소 :</div>
                                        <input type="text" name="proj_work_place" id="proj_work_place"
                                               class="form-control form-control-muted col-6 col-md-4 "
                                               placeholder="상세주소">
                                        <div class="col-1"></div>
                                        <input type="button" class="col-3 btn btn-primary"
                                               onclick="DaumPostcode()" value="주소찾기"/>
                                    </div>
                                   <!--  <div class="row my-3 pt-3 inline clearfix">
                                        <div class="col-3 col-md-2 pr-0 text-right align-self-center">주소 :</div>
                                        <input type="text" name="proj_work_place1" id="proj_work_place1"
                                               class="form-control form-control-muted col-9"
                                               placeholder="주소" />
                                    </div> -->
						

								</div>


								<div class="form-group">
									<label for="working_time" style="font-weight: bold;">근무시간 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_work_time" class="form-control"
										placeholder="ex)월-금 9시-6시" required>
								</div>
								<div class="form-group">
									<label for="private_equip" style="font-weight: bold;">개인장비 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_work_equip" class="form-control"
										placeholder="0개인장비 1장비제공" required>
								</div>
								<div class="form-group">
									<label for="well_fare" style="font-weight: bold;">복리후생 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_walfare" class="form-control"
										placeholder="0음식 제공  1음식 미제공" required>
								</div>


							</div>
							<div class="col-xl-10" style="margin-left: 80px;">

								<div class="form-group mt-3 mt-xl-0">
									<label for="project_now" class="mb-0" style="font-weight: bold;">프로젝트 진행상황</label>
									<p class="text-muted font-14">Recommended PDF type</p>

									<form action="/" method="post" class="dropzone dz-clickable"
										id="myAwesomeDropzone" data-plugin="dropzone"
										data-previews-container="#file-previews"
										data-upload-preview-template="#uploadPreviewTemplate">
										<div class="dz-message needsclick">
											<i class="h3 text-muted dripicons-cloud-upload"></i>
											<h4>Drop files here or click to upload.</h4>
										</div>
									</form>

									<!-- Preview -->
									<div class="dropzone-previews mt-3" id="file-previews"></div>

									<!-- file preview template -->
									<div class="d-none" id="uploadPreviewTemplate">
										<div class="card mt-1 mb-0 shadow-none border">
											<div class="p-2">
												<div class="row align-items-center">
													<div class="col-auto">
														<img data-dz-thumbnail="" src="#"
															class="avatar-sm rounded bg-light" alt="">
													</div>
													<div class="col pl-0">
														<a href="javascript:void(0);"
															class="text-muted font-weight-bold" data-dz-name=""></a>
														<p class="mb-0" data-dz-size=""></p>
													</div>
													<div class="col-auto">
														<!-- Button -->
														<a href="" class="btn btn-link btn-lg text-muted"
															data-dz-remove=""> <i class="dripicons-cross"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end file preview template -->
								</div>

								<div class="form-group">
									<label for="project_overview" style="font-weight: bold;">프로젝트 상세설명</label>
									<textarea class="form-control" name="proj_detail" rows="5">&lt;프로젝트 제반사항&gt;
예시) 필요기능, 동작환경, 현재상황, 산출물
                                </textarea>
								</div>
								
								
					 			
								
								
								<div class="form-group">
									<label>member_no</label>
									<input class="form-control" name="member_no" id="member_no"
						value='${member.member_no }' readonly="readonly">
								</div>


								<div class="form-group" align="center">
								
								<c:if test="${not empty member.member_no}">
									<input class="btn btn-default" type="reset" value="취소">
									<input class="btn btn-default" type="submit" value="등록">
								</c:if>
									
								</div>
								
								
							
							</div>
							<!-- end col-->
						</div>
						<!-- end row -->

					</div>
					<!-- end card-body -->
				</div>
				<!-- end card-->
			</div>
			<!-- end col-->
		</div>
	</div><!-- col-xl-10 -->	
	</form>
</div>	

<div id="frogue-container" class="position-right-bottom" data-chatbot="f397ce6d-a5db-4fc4-b8d4-4f2c9c143b34" data-user="nannanru@gmail.com" data-init-key="value"></div>



<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>

	
 <script src="https://code.$.com/$-3.1.0.js"></script>	
 <!--날짜계산 위한 js 추가  -->
 <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment-with-locales.min.js"></script>	


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

//카카오 주소API 실행 함수
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("proj_work_place").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            /* document.getElementById("proj_work_place1").focus(); */
        }
    }).open();
}

$(function(){	
	$("#proj_end_date").change(function(){
		
		if($("#proj_start_date").val() === "" || $("#proj_end_date").val() === ""){
			$("#cal_date").text("Invalid Date");
		}else{
			 var projStartDate = moment($("#proj_start_date").val());
	         var projEndDate = moment($("#proj_end_date").val());
	         var diff = projEndDate.diff(projStartDate, "days");
	         $("#cal_date").text("총"+diff+"일"); 	         
		}
	
	});
	
	$("#proj_title").change(function(){
		if($("#member_no").val() == "")
			alert("로그인을 먼저 해주세요.");
	});
 
}); 

	</script>





	
	<script type="text/javascript">
    $(window).on('beforeunload', function () {
      return '작성하신 내용은 임시 저장됩니다.'
    });
    $(document).on('submit', 'form', function (event) {
      $(window).off('beforeunload');
    });

    var category_stack;

    
      var has_description = false;
    

    function subcategory_refresh(is_init) {
      var category_set = [];
      var target = [];
      $('input[name="category"]:checked').each(function(idx, obj){
        category_set.push($(obj).val());
      });
      if (category_set.length > 0) {
        var has_plan = category_set.indexOf('plan') > -1,
            has_design = category_set.indexOf('design') > -1,
            has_develop = category_set.indexOf('develop') > -1;
        $('[name="subcategory"]').parent().css('display', 'none');
        if (!has_design && !has_develop) {
          target = ['web','application','wordpress','software','commerce','game','embeded','etc','product','presentation','print','logo','video'];
        } else if (!has_plan && !has_develop) {
          target = ['web','application','product','presentation','print','commerce','logo','graphic','video','game','etc'];
        } else if (!has_plan && !has_design) {
          target = ['web','application','wordpress','publishing','software','commerce','game','embeded','etc'];
        } else if (has_design && has_develop) {
          target = ['web','application','wordpress','publishing','software','commerce','game','embeded','etc','product'];
        } else if (has_plan && has_design) {
          target = ['web','application','wordpress','software','commerce','game','embeded','etc','presentation','print','logo','graphic','video'];
        } else if (has_plan && has_develop) {
          target = ['web','application','wordpress','publishing','software','commerce','game','embeded','etc'];
        }
        $.each($('[name="subcategory"]'), function(idx, obj) {
          var $input = $(obj);
          if (target.indexOf($input.val()) > -1) {
            $input.parent().css('display', 'inline-block')
          }
          if (!is_init) {$input.prop('checked', false);}
        });
      } else {
        $('#subcategory_input_group').css('display', 'none');
      }
      if(is_form_valid('temporary_project_phase_1').length > 0) {
        $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', true);
      } else {
        $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', false);
      }
    }


    $(document).ready(function() {
      refresh_saved_time();
      window.setInterval(refresh_saved_time, 3000);



      $('input[name="category"]').on('change', function (e) {
        $('#subcategory_input_group').css('display', 'block');
        category_stack = $(this);
        if (has_description) {
          $('#category_warning_modal').show();
        } else {
          subcategory_refresh(is_init=false);
        }
        return e
      });

      $('input[name="title"]').on('change', function() {
        var csrftoken = Cookies.get('csrftoken');
        var $form = $('#temporary_project_phase_1');
        function csrfSafeMethod(method) {
          return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
        }
        $.ajaxSetup({
          beforeSend: function(xhr, settings) {
            if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
              xhr.setRequestHeader("X-CSRFToken", csrftoken);
            }
          }
        });
        $.ajax({
          type: "POST",
          data: $form.serialize(),
          success: function (data) {
            saved_time = data.saved_time;
            refresh_saved_time();
          }
        });
      });

      $('#category_warning_modal').find('[modal-action="close"]').on('click', function() {
        category_stack.prop('checked', !category_stack.prop('checked'));
        var current_status = category_stack.prop('checked');
        if(current_status) {
          category_stack.closest('.select-card').addClass('checked');
        } else {
          category_stack.closest('.select-card').removeClass('checked');
        }
      });

      $('#category_warning_modal').find('[modal-action="accept"]').on('click', function() {
        $('#category_warning_modal').hide();
        $('input[name="refresh_description"]').val('True');
        subcategory_refresh(is_init=false);
      });

      if(is_form_valid('temporary_project_phase_1').length > 0) {
        $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', true);
      } else {
        $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', false);
      }

      $('input').on('change keyup', function() {
        if(is_form_valid('temporary_project_phase_1').length > 0) {
          $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', true);
        } else {
          $('#temporary_project_phase_1').find('[type="submit"]').prop('disabled', false);
        }
      });
    })

  </script>
  
  <script><!--챗봇 api-->
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 
