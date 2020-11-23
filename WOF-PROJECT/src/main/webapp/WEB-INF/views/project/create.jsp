<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>프로젝트 등록하기</title>
	
	<!-- Favicon -->
	<link rel="icon"
		href="${pageContext.request.contextPath}/template/assets/img/brand/favicon.png"
		type="image/png">
	<!-- Fonts -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
	<!-- Icons -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/nucleo/css/nucleo.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
		type="text/css">
	<!-- Argon CSS -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/assets/css/argon.css?v=1.2.0"
		type="text/css">
		
</head>

<body>
	 
	<!-- Header -->
	<jsp:include page="../includes/header.jsp"></jsp:include>


	<!-- Main content -->
	<div class="main-content" id="panel">
	<form action="/project/create" method="post">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-xl-5" style="margin-left: 130px;">

								<div class="form-group">
									<label for="projectname" style="font-weight: bold;">프로젝트명 <span class="required" style="color: #CE3861;">*</span></label>
									<input type="text" name="proj_title" class="form-control"
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
					<input id="category_develop" name="proj_reqr_skill" type="checkbox"  value="develop">
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
					<input id="category_design" name="proj_reqr_skill" type="checkbox" value="design">
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
					<input id="category_plan" name="proj_reqr_skill" type="checkbox" value="plan">
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
														type="checkbox" value="web">
														 <span>#웹</span></label></span> <span><label
													class="chip-choice-client" style="display: inline-block;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="application">
														<span>#애플리케이션</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="commerce"> <span>#커머스,
															쇼핑몰</span></label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="software"> <span>#일반
															소프트웨어</span></label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="publishing"> <span>#퍼블리싱</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="wordpress"> <span>#워드프레스</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="embeded"> <span>#임베디드</span></label></span>
												<span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="product"> <span>#제품</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="presentation"> <span>#프레젠테이션</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="graphic"> <span>#그래픽</span></label></span>
												<span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="print"> <span>#인쇄물</span></label></span> <span><label
													class="chip-choice-client" style="display: none;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="logo"> <span>#로고</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: none;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="video"> <span>#영상</span></label></span> <span><label
													class="chip-choice-client" style="display: inline-block;">
														<input class="theme-client wishket-chip"
														name="proj_reqr_skill" type="checkbox" value="game"> <span>#게임</span>
												</label></span> <span><label class="chip-choice-client"
													style="display: inline-block;"> <input
														class="theme-client wishket-chip" name="proj_reqr_skill"
														type="checkbox" value="etc"> <span>#기타</span></label></span>
											</div>
										</div>

									</div><!-- col-xl-5 -->
				

								</div><!-- col-xl-5 -->

							<div class="col-xl-5">
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
									<div class="row">
										<div class="col">
										<!-- name="h_area1" -->
									  <select class="form-control" name="proj_work_place" onChange="cat1_change(this.value,proj_work_place1)" >
										   <option>-선택-</option>
										<option value='1'>서울</option>
										<option value='2'>부산</option>
										<option value='3'>대구</option>
										<option value='4'>인천</option>
										<option value='5'>광주</option>
										<option value='6'>대전</option>
										<option value='7'>울산</option>
										<option value='8'>강원</option>
										<option value='9'>경기</option>
										<option value='10'>경남</option>
										<option value='11'>경북</option>
										<option value='12'>전남</option>
										<option value='13'>전북</option>
										<option value='14'>제주</option>
										<option value='15'>충남</option>
										<option value='16'>충북</option>
										  </select>
										</div>
										
										<div class="col">
										  <select class="form-control"  name="proj_work_place1">
										   <option>-선택-</option>
										  </select>
											</div><!-- col -->
											</div><!-- row -->
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
<div class="col-xl-10" style="margin-left: 130px;">

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
							


								<div class="form-group" align="center">
									<input class="btn btn-default" type="reset" value="취소">
									<input class="btn btn-default" type="submit" value="등록">
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

<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>

	
 <script src="https://code.jquery.com/jquery-3.1.0.js"></script>	
 <!--날짜계산 위한 js 추가  -->
 <script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment-with-locales.min.js"></script>	

<script type="text/javascript">

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
 
}); 

	/* function itemChange(){
		 
		var first = ["웹", "애플리케이션", "커머스&쇼핑몰", "일반 소프트웨어", "퍼블리싱", "워드프레스", "임베디드", "게임", "기타"];
		var second = ["웹", "애플리케이션", "커머스&쇼핑몰", "제품", "프레젠테이션", "그래픽", "인쇄물", "로고", "영상", "게임", "기타"];
		var third = ["웹", "애플리케이션", "커머스&쇼핑몰", "일반소프트웨어", "워드프레스", "임베디드", "제품", "프레젠테이션", "인쇄물", "로고", "영상", "게임", "기타"];

		var selectItem = $("#select1").val();
		 
		var changeItem;
		  
		if(selectItem == "개발"){
		  changeItem = first;
		}
		else if(selectItem == "디자인"){
		  changeItem = second;
		}
		else if(selectItem == "기획"){
		  changeItem =  third;
		}
		 
		$("#select2").empty();
		 
		for(var count = 0; count < changeItem.size(); count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $("#select2").append(option);
		            } 
		 

		                        
		} */

	 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
	 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');

	 var cat2_num = new Array();
	 var cat2_name = new Array();

	 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);
	 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

	 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);
	 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');

	 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);
	 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');

	 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);
	 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');

	 cat2_num[5] = new Array(76,77,78,79,80);
	 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');

	 cat2_num[6] = new Array(81,82,83,84,85);
	 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');

	 cat2_num[7] = new Array(86,87,88,89,90);
	 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');

	 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);
	 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');

	 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);
	 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');

	 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);
	 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');

	 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);
	 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');

	 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);
	 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

	 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);
	 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

	 cat2_num[14] = new Array(230,231,232,233);
	 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

	 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);
	 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

	 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);
	 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');



	function cat1_change(key,sel){
	 if(key == '') return;
	 var name = cat2_name[key];
	 var val = cat2_num[key];

	 for(i=sel.length-1; i>=0; i--)
	  sel.options[i] = null;
	 sel.options[0] = new Option('-선택-','', '', 'true');

	 for(i=0; i<name.length; i++){
	  sel.options[i+1] = new Option(name[i],val[i]);
	 }

	}
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
  
  
	</body>
 </html>