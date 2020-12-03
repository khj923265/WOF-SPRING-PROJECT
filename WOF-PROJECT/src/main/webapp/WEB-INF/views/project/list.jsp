<%@page import="org.wof.domain.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<!-- Header & Menu -->
	<%@ include file="../includes/header.jsp" %>



	<!-- Main Content -->
	<div class="header pb-6 container">
		<div class="container-fluid">
			<div class="header-body text-right ">
				<div class="row py-4">
					<div class="col-lg-6 col-7">
						<form
							class="navbar-search navbar-search-light form-inline mr-sm-3"
							id="navbar-search-main">
							<div class="form-group mb-0">
								<div
									class="input-group input-group-alternative input-group-merge mr-2">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-search"></i></span>
									</div>
									<input class="form-control" placeholder="Search" type="text"
										value="searchKey">
								</div>
								<button type="button" class="btn btn-secondary">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Page content -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-3">
				<div class="container-fluid mt--6">
					<div class="row">

						<div class="card card-profile">

							<div class="card-header text-left border-0 pt-8 pt-md-4 pb-0 pb-md-4">
								
									<i class="ni ni-active-40"></i>
									<span>검색</span><br><br>
								
							</div>
							<div class="card-body pt-0">
								<div class="container">
									<div class="row col justify-content-center">
										<div class="col-lg-3 order-lg-2"></div>
									</div>

									<div class="row">
										<div class="col"></div>
									</div>
									<div class="text-left">
										
										
										
										<h5 class="h3">프로젝트 카테고리</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck1"> <label
												class="custom-control-label" for="customCheck1">개발</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck2"> <label
												class="custom-control-label" for="customCheck2">디자인</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck3"> <label
												class="custom-control-label" for="customCheck3">기획</label>
										</div>
										<br>

										<h5 class="h3">프로젝트 분야</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck4"> <label
												class="custom-control-label" for="customCheck4">#웹</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck5"> <label
												class="custom-control-label" for="customCheck5">#애플리케이션</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck6"> <label
												class="custom-control-label" for="customCheck6">#커머스,쇼핑몰</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck7"> <label
												class="custom-control-label" for="customCheck7">#일반 소프트웨어</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck8"> <label
												class="custom-control-label" for="customCheck8">#퍼블리싱</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck9"> <label
												class="custom-control-label" for="customCheck9">#워드프레스</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck10"> <label
												class="custom-control-label" for="customCheck10">#임베디드</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck11"> <label
												class="custom-control-label" for="customCheck11">#제품</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck12"> <label
												class="custom-control-label" for="customCheck12">#프레젠테이션</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck13"> <label
												class="custom-control-label" for="customCheck13">#그래픽</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck14"> <label
												class="custom-control-label" for="customCheck14">#인쇄물</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck15"> <label
												class="custom-control-label" for="customCheck15">#로고</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck16"> <label
												class="custom-control-label" for="customCheck16">#영상</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck17"> <label
												class="custom-control-label" for="customCheck17">#게임</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck18"> <label
												class="custom-control-label" for="customCheck18">#기타</label>
										</div>
										
										<br>
														
											
											
											
										
										

										<h5 class="h3">프로젝트 기술</h5>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck19"> <label
												class="custom-control-label" for="customCheck19">Bash</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck20"> <label
												class="custom-control-label" for="customCheck20">C/C++/C#</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck21"> <label
												class="custom-control-label" for="customCheck21">Java</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck22"> <label
												class="custom-control-label" for="customCheck22">JavaScript</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck23"> <label
												class="custom-control-label" for="customCheck23">Swift</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck24"> <label
												class="custom-control-label" for="customCheck24">Perl</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck25"> <label
												class="custom-control-label" for="customCheck25">Ruby</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck26"> <label
												class="custom-control-label" for="customCheck26">Python</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck27"> <label
												class="custom-control-label" for="customCheck27">PHP</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck28"> <label
												class="custom-control-label" for="customCheck28">R</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck29"> <label
												class="custom-control-label" for="customCheck29">VBA</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck30"> <label
												class="custom-control-label" for="customCheck30">Scala</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck31"> <label
												class="custom-control-label" for="customCheck31">Go</label>
										</div>
										<br>

										<h5 class="h3">근무지역</h5>
										
									<div class="row">
										 <div class="col">
										 <select class="form-control"  name="proj_work_place" onChange="cat1_change(this.value,proj_work_place1)" >
											<option selected>-선택-</option>
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
										<select class="form-control" name="proj_work_place1">
										   <option  selected>-선택-</option>
											<option value='215'>군산시</option>
											<option value='216'>김제시</option>
											<option value='217'>남원시</option>
											<option value='218'>익산시</option>
											<option value='219'>전주시 덕진구</option>
											<option value='220'>전주시 완산구</option>
											<option value='221'>정읍시</option>
											<option value='222'>고창군</option>
											<option value='223'>무주군</option>
											<option value='224'>부안군</option>
											<option value='225'>순창군</option>
											<option value='226'>완주군</option>
											<option value='227'>임실군</option>
											<option value='228'>장수군</option>
											<option value='229'>진안군</option>
										  </select>
										</div><!-- col --> 
									</div><!-- row -->
									
									
									
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- list -->
			<div class="col-9 container-fluid mt--6" >
				<div class="row">
					<div class="col">
						<div class="card">
							<!-- Card header -->
							<div class="card-header border-0">
								<h3 class="mb-0">프로젝트 리스트</h3>
							</div>
							
						<!-- pagination -->
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-end">
										<c:if test="${pageDto.prev }">
											<li class="page-item">
												<a class="page-link" href="${pageDto.startPage - 1 }" tabindex="-1">
												<i class="fa fa-angle-left"></i>
												<span class="sr-only">Prev</span>
												</a>
											</li>
										</c:if>
	
										<c:forEach var="num" begin="${pageDto.startPage }" end="${pageDto.endPage }">
											<li class="page-item ${pageDto.standard.pageNum == num ? 'active':'' }">
												<a class="page-link" href="${num }">
												<c:out value="${num }" />
												</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageDto.next }">
											<li class="page-item">
												<a class="page-link" href="${pageDto.endPage + 1 }">
												<i class="fa fa-angle-right"></i>
												<span class="sr-only">Next</span>
												</a>
											</li>
										</c:if>
									</ul>
								</nav>
								
								<form id="pagingActionForm" action="/project/list" method="get">
									<input type="hidden" name="pageNum" value="${pageDto.standard.pageNum }">
									<input type="hidden" name="amount" value="${pageDto.standard.amount }">
								</form>
								<!-- pagination -->
								
							
							
							<!-- card body -->
							<div class="card card-stats">


								


								<c:forEach var="project" items="${list}">
									<!-- Card body -->
									<div class="ml-3 mt-3 mb-3 card-body">
									
										<div class="row">
											<div class="col-12 row text-center ">

												<h2 class="card-title text-uppercase text-muted mb-0 mr-2">
													${project.getProj_id()}
													<a	href='/project/read?proj_id=<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a> 
													<%-- <a class="move" href='<c:out value="${project.getProj_id()}"/>'>${project.getProj_title()}</a> --%>
												</h2>
												
												
												<span class="justify-content-center">
													<i id="related_proj" class="ni ni-favourite-28 mt-2" >
													<input type="hidden" value="${project.getProj_id()}" name="related_proj" id="related">
													</i>
												</span>&nbsp;&nbsp;&nbsp;&nbsp;
												
												
												
												
											
											<fmt:parseDate value="2020-11-25" var="strPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
											<fmt:parseDate value="${project.getProj_apply_deadline()}" var="endPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>


												<i class="ni ni-notification-70 mr-2"></i>
												<span  style="color: red;">마감  ${endDate - strDate}일 전</span>
												

											</div>
										</div>

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-check-bold mr-3"></i><span
												class="text-success mr-2">${project.getProj_career()}</span>
											<i class="ni ni-money-coins mr-3"></i><span
												class="text-success mr-2">${project.getProj_estimate()}
												원</span>
										</p>
										
									 	<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-album-2"></i><span
												class="text-success mr-2">${project.getProj_start_date()}</span>
											<i class="ni ni-album-2"></i><span
												class="text-success mr-2">${project.getProj_end_date()}</span>
										</p> 

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-single-02 mr-3"></i><span
												class="text-success mr-2">${project.getProj_walfare()}명</span>
											<i class="ni ni-time-alarm mr-3"></i><span
												class="text-success mr-2">${project.getProj_work_time()}</span>
											<i class="ni ni-compass-04 mr-3"></i><span
												class="text-success mr-2">${project.getProj_work_place()}</span>
										</p>

										<div class="mt-3 mr-3 text-sm">
											<span class="text-nowrap"> <%--  <c:choose>
           <c:when test="${project.getProj_detail()}" > 60}">
   					${fn:substring(TextValue,0,60)}<br>${fn:substring(TextValue,61,120)}
   					<br>${fn:substring(TextValue,121,180)}<br>${fn:substring(TextValue,181,TextValue.length())}
   			</c:when>
   			<c:otherwise>
   				<c:out value="${fn:substring(TextValue,0,TextValue.length())}"/>
   			</c:otherwise>	
  
    </c:choose> --%> <c:set var="TextValue"
													value="${project.getProj_detail()}" />
												${fn:substring(TextValue,0,70)}<br>${fn:substring(TextValue,71,140)}
												<br>${fn:substring(TextValue,141,210)}<br>${fn:substring(TextValue,211,280)}
												<br>${fn:substring(TextValue,281,350)} <br>${fn:substring(TextValue,351,420)}...
											</span>
										</div>

										<p class="mt-3 mb-0 text-sm">
											<i class="ni ni-chart-bar-32 mr-3"></i><span
												class="text-success mr-2">3명지원</span>
										</p>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- list end -->
	
	<div id="frogue-container" class="position-right-bottom" data-chatbot="f397ce6d-a5db-4fc4-b8d4-4f2c9c143b34" data-user="nannanru@gmail.com" data-init-key="value"></div>

	
	<!-- Footer -->
	<%@ include file="../includes/footer.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var pagingActionForm = $("#pagingActionForm");
			
			$(".page-item a").on("click", function(e) {
				e.preventDefault();
				
				pagingActionForm.find("input[name='pageNum']").val($(this).attr("href"));
				pagingActionForm.submit();
			});

		});
		
		
		$(".move").on("click", function(e){
			e.preventDefault();
			pagingActionForm.append("<input type='hidden' name='proj_id' value='"+ $(this).attr("href")+"'>");
			pagingActionForm.attr("action","/project/read");
			pagintActionForm.submit();
		});
		
</script>

	
	
	<script type="text/javascript">

 
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


<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 


