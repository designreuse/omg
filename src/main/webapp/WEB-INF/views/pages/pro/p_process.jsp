<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The OMG ~~</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/company/resources/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
	<script src="/company/resources/js/jquery-1.11.2.js"></script>
	<script>
	$(function(){
	 
		$.ajax({
			url: "p_selectEmp",
			data : "dept=D", //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
			dataType: "json",
			success: function(json){
				 
				$("#list").empty();
				var str = "";
				$.each(json, function(index, item) { 
					str += "<tr>";
					str += "<td class='small-col'><input name='cbox' value='"+item.employeeId+"' type='checkbox' /></td>";
					str += "<td>" + item.employeeId + "</td>";
					str += "<td>" +"<a  id='update' empid="+item.employeeId+">" +item.name+"</a>"+"</td>";
					str += "<td>" +item.deptName + "</td>";
					if(item.teamName==null){
						str += "<td>부장</td>";
					}
					else{
						str += "<td>" +item.teamName+"</td>";	
					}
					str += "<td>" +item.posName+"</td>";
					str += "<td>" +item.salary+"</td>";
					str += "<td>" +item.commition+"</td>";
					str += "<td>" +item.hiredate + "</td>";
					str += "<td>" +item.phone+"</td>";
					str += "<td>" +item.address+"</td>";
					str += "</tr>"; 	
				});
				$("#list").append(str);
			},
			error: function(){
				alert("error");
			}
			
		});
		
		
		
		/*부서별로 리스트뿌리기  */
		function selectDept(dept) {
			
    			$.ajax({
    				url: "p_selectEmp",
					data : "dept=" + dept,
    				dataType: "json",
    				success: function(json){
    					$("#list").empty();
    					var str = "";
    					$.each(json, function(index, item) {
    						 
    						str += "<tr>";
    						str += "<td class='small-col'><input name='cbox' value='"+item.employeeId+"' type='checkbox' /></td>";
    						str += "<td>" +item.employeeId+ "</td>";
    						str += "<td>" +"<a id='update' empid="+item.employeeId+">"+item.name+"</a>"+"</td>";
    						str += "<td>" +item.deptName + "</td>";
    						if(item.teamName==null){
    							str += "<td>부장</td>";
    						}
    						else{
    							str += "<td>" +item.teamName+"</td>";	
    						}
    						str += "<td>" +item.posName+"</td>";
    						str += "<td>" +item.salary+"</td>";
    						str += "<td>" +item.commition+"</td>";
    						str += "<td>" +item.hiredate + "</td>";
    						str += "<td>" +item.phone+"</td>";
    						str += "<td>" +item.address+"</td>";
    						str += "</tr>"; 
    						
    					});
    					$("#list").append(str);
    				}
    			});
    		}

    		$("#manage").click(function(){
    			selectDept("M");
    		});
    		$("#development").click(function(){
    			selectDept("D");
    		});
    		
    		$("#run").click(function(){
    			selectDept("R");
    		});	
	});

	</script>

</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="/WEB-INF/views/tiles/header.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 내용 부분 -->
		<!-- Left side column. contains the logo and sidebar -->
		<!-- 목록 눌럿을때 보이는 부분 -->
		<jsp:include page="/WEB-INF/views/tiles/sidebar.jsp"></jsp:include>
		<!-- Right side column. Contains the navbar and content of the page -->
		<!-- 내용부분... -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>인사 & 회계 부서 업무</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">인사 & 회계 부서 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
						 
							<div class="box-body">
								<div class="row">
									<div class="col-md-2 col-sm-4" id="bnt_window">
										<div class="box-header">
											<h3 class="box-title" id="h3">직원 관리</h3>
										</div>
									 
										<div style="margin-top: 15px;">
											<a id="emp" class="btn btn-danger btn-flat">직원 관리</a>
										</div>
										<div style="margin-top: 15px;">
											<a id="sale" class="btn btn-warning btn-flat">매출 관리</a>
										</div>
										
									</div>
									
									<div id="detailview" class="col-md-10 col-sm-8">
										<div class="row pad">
											<div class="input-group">
												<span style="float: right !important; margin: 10px;">
													<button value="D" id="development"
														class="btn btn-primary btn-flat">개발부</button>
													<button value="M" id="manage"
														class="btn btn-success btn-flat">유지보수부</button>
													<button value="R" id="run" 
														class="btn btn-info btn-flat">경영부</button>
												</span>
											</div>
											<!-- </div> -->
										</div>
										<!-- /.row -->
										<div class="table-responsive">
											<table class="table table-bordered" border="1">
												<thead>
													<tr align="center">
														<th>선 택</th>
														<th>사 번</th>
														<th>이 름</th>
														<th>부 서</th>
														<th>팀</th>
														<th>직 책</th>
														<th>연 봉</th>
														<th>Com.</th>
														<th>입사일</th>
														<th>핸드폰</th>
														<th>주 소</th>
													</tr>
												</thead>
												<tbody id="list">

												</tbody>
											</table>
										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix" >
								<div class="pull-right" id="bnt">
									<button id="new_bnt" class="btn btn-primary">직원 등록</button>
									<a id="del_bnt" class="btn btn-primary">직원 삭제</a>
								</div>
							</div>
							<!-- box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col (MAIN) -->
				</div>
				<!-- MAILBOX END -->
			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/company/resources/js/AdminLTE/demo.js"
		type="text/javascript"></script>
	<script>
	$(function(){
		 
		//매출관리 버튼 눌렀을 경우.
		$("#bnt_window").on("click","#sale",function(){
			date = new Date();
			year = date.getFullYear();	//현재 년도
			start = 1995;
			$("#detailview").empty();
			$("#h3").text("매출 관리");
			$("#bnt").empty();
			var sales="<div class='row pad'><div class='input-group'><span style='float: right !important; margin: 10px;'>"
					+"<select id='years' name='years'>";
			$(function(){
				while(start<=year){
					sales += "<option value="+start+">"+start+"</option>";
					start++;
				}
			});
					
			sales +="</select></span></div></div>"
				+"<h3><div id='sales'></div></h3>"
				+"<div class='table-responsive'><table class='table table-bordered' border='1'>"
				+"<thead><tr align='center'><th>부서 이름</th><th>매 출 액</th></tr></thead>"
				+"<tbody id='list'>";
				
			sales += "</tbody></table></div>";
			$(sales).appendTo($("#detailview"));  
			
			
			$(function(){
				 
				$('#years').change(function(){
					years = $("select[name='years']").val();	
					 
					$("#sales").empty();
					$.ajax({
						url:"p_sumProPrice",
						data:"year="+years,
						dataType:"json",
						success:function(json){
							$("#sales").text(years+"년도 총 매출액: "+json);
						},
						error:function(){
							$("#sales").text(years+"년도 총 매출액: 0");
						}
					});
					
				});
			}); 
		
		});
		
		
		$("#emp").click(function(){
			$(this).attr("href","index_p");
		});
		
		//이름 클릭시 수정화면 
		$("#list").on("click","#update",function(){
			var id = $(this).attr("empid");
			$("#detailview").empty();
			$("#h3").text("정보 수정");
			$("#bnt").empty();
			
			$.ajax({
				url:"p_update",
				data:"id="+id,
				dataType:"json",
				success: function(json){
					d = json.departmentId;
					t = json.teamId;
					p = json.positionId;
				 
					var str="";
						str += "<div class='table-responsive'><form action='p_update?id="+json.employeeId+"' method='POST'><table class='table table-bordered' border='1'>";
						str += "<tr>"+"<th>사 번</th>"+"<td>" +json.employeeId+ "</td></tr>";
						str += "<tr>"+"<th>이 름</th>"+"<td>"+json.name+"</td></tr>";
						str += "<tr>"+"<th>Manager</th>"+"<td><input type='text' value="+json.manager+" name='manager'></td>";
						str += "<tr>"+"<th>부 서</th>";
						$.ajax({
							url: "p_deptSelect",
							dataType:"json",
							async: false,
							success:function(json){
								str += "<td><select name='dept'>";
								$.each(json,function(index,item){
									if(d==item.departmentId){
										str += "<option value="+item.departmentId+" selected='selected'>"+item.departmentName+"</option>";
									} else{
										str += "<option value="+item.departmentId+">"+item.departmentName+"</option>";									
									}
	
								});
								str += "</select></td></tr>";
							}
						}); 
						str += "<tr>"+"<th> 팀 </th>";
						$.ajax({
							url: "p_teamSelect",
							dataType:"json",
							async: false,
							success:function(json){
								str += "<td><select name='team'>";
								$.each(json,function(index,item){
									if(t==item.teamId){
										str += "<option value="+item.teamId+" selected='selected'>"+item.teamName+"</option>";
									} else{
										str += "<option value="+item.teamId+">"+item.teamName+"</option>";
									}
								});
								str += "</select></td></tr>";
							}
						}); 
						str += "<tr>"+"<th>직 책</th>";
						$.ajax({
							url: "p_posSelect",
							dataType:"json",
							async: false,
							success:function(json){
								str += "<td><select name='pos'>";
								$.each(json,function(index,item){
									if(p==item.positionId){
										str += "<option value="+item.positionId+" selected='selected'>"+item.positionName+"</option>";
									} else{
										str += "<option value="+item.positionId+">"+item.positionName+"</option>";
									}
								});
								str += "</select></td></tr>";
							}
						});
						
						
						str += "<tr>"+"<th>연 봉</th>"+"<td><input type='text' value="+json.salary+" name='salary'></td>";
						str += "<tr>"+"<th>Com.</th>"+"<td><input type='text' value="+json.commition+" name='commition'></td>"; 
						str += "</tr></table>"; 
					    str += "<input type='submit'  class='btn btn-primary btn-sm' value='수정'>";
					    str += "<a  class='btn btn-primary btn-sm' id='cancel' >취소</a>";
					    str += "</form></div>";
						$(str).appendTo($("#detailview"));  
			 
				}
				
			});
		});
		//수정화면에서 취소버튼 (돌아가기)
		$("#detailview").on("click","#cancel",function(){
			$(this).attr("href","index_p");				
		});
		

		//새로운 직원 등록하기
		$("#bnt").on("click","#new_bnt",function(){
			$("#detailview").empty();
			$("#h3").text("직원 등록");
			$("#bnt").empty();
			
					var str="";
					str += "<div class='table-responsive'><form action='p_insert' method='POST'><table class='table table-bordered' border='1'>";
					str += "<tr>"+"<th>사 번</th>"+"<td><input type='text' name='id'id='id'><span id='empId'></span></td></tr>";
					str += "<tr>"+"<th>이 름</th>"+"<td><input type='text'name='name'></td></tr>";
					str += "<tr>"+"<th>입사일(yyyy-mm-dd)</th>"+"<td><input type='text' name='hiredate'></td></tr>";
					str += "<tr>"+"<th>Manager</th>"+"<td><input type='text' name='manager'></td></tr>";
					str += "<tr>"+"<th>부 서</th>";
					$.ajax({
						url: "p_deptSelect",
						dataType:"json",
						async: false,
						success:function(json){
							str += "<td><select name='dept'>";
							$.each(json,function(index,item){
								str += "<option value="+item.departmentId+">"+item.departmentName+"</option>";
							});
							str += "</select></td></tr>";
						}
					}); 
					str += "<tr>"+"<th> 팀 </th>";
					$.ajax({
						url: "p_teamSelect",
						dataType:"json",
						async: false,
						success:function(json){
							str += "<td><select name='team'>";
							$.each(json,function(index,item){
								str += "<option value="+item.teamId+">"+item.teamName+"</option>";
							});
							str += "</select></td></tr>";
						}
					}); 
					str += "<tr>"+"<th>직 책</th>";
					$.ajax({
						url: "p_posSelect",
						dataType:"json",
						async: false,
						success:function(json){
							str += "<td><select name='pos'>";
							$.each(json,function(index,item){
								str += "<option value="+item.positionId+">"+item.positionName+"</option>";
							});
							str += "</select></td></tr>";
						}
					}); 
					str += "<tr>"+"<th>연 봉</th>"+"<td><input type='text'  id='t_sal' name='salary'><span id='sal'></span></td></tr>";
					str += "<tr>"+"<th>핸드폰</th>"+"<td><input type='text'name='phone'></td></tr>";
					str += "<tr>"+"<th>주 소</th>"+"<td><input type='text' name='address'></td></tr>";
					str += "<tr>"+"<th>성 별</th>"+"<td><input type='text'name='gender'></td></tr>";
					str += "<tr>"+"<th>비밀번호</th>"+"<td><input type='text' name='password'></td>"; 
					str += "</tr></table>"; 
					str += "<input type='submit'  class='btn btn-primary btn-sm' value='등록'>";
				    str += "<a  class='btn btn-primary btn-sm' id='cancel' >취소</a>";
				    str += "</form></div>";
					$(str).appendTo($("#detailview"));  
			 		
					$("#t_sal").keydown(function(){
						posId = $("select[name='pos']").val();
						$.ajax({
							url: "p_salarySelect",
							data:"posid="+posId,
							dataType:"json",
							async: false,
							success:function(json){
								min = json.minSalary;
								max = json.maxSalary;
								$("#sal").text("minSalary: "+min + " / maxSalary: " +max);
							}
						});
					});
					//사번 입력시 중복 확인
					$("#id").keyup(function(){
						id_text = $("#id").val();
						  $.ajax({
							url: "p_empSelect",
							data:"posid="+id_text,
							dataType:"json",
							async: false,
							success:function(json){
								if(json!=null){
									$("#empId").text("이미 있는 사번입니다.");	
								} 
							},
							error:function(){
								$("#empId").text("");	
							}
						});   
					});
		});
		
		
		
		//선택된 직원 삭제하기
		$("#bnt").on("click","#del_bnt",function(){
		
			var cbox = [];
			$("input[name=cbox]:checked").each(function() {
				cbox.push($(this).val());
			});
			
			if(cbox.length == 1){
				$("#del_bnt").attr("href", "p_delete?id="+cbox);
			} else if(cbox.length == 0){
				alert("선택된 직원이 없습니다.");
			} else{
				alert("한명만 선택하세요.");
			}
		});
		
	});
		
 
	</script>
</body>
</html>
