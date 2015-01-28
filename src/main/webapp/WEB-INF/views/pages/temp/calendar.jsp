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
<!-- fullCalendar -->
<link
	href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.print.css"
	rel="stylesheet" type="text/css" media='print' />
<!-- Theme style -->
<link href="/company/resources/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
</head>
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="/WEB-INF/views/tiles/header.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 내용 부분 -->
		<!-- Left side column. contains the logo and sidebar -->
		<!-- 목록 눌럿을때 보이는 부분 -->
		<jsp:include page="/WEB-INF/views/tiles/sidebar.jsp"></jsp:include>
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Calendar</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Calendar</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- 전체 영영 : row  -->
				<div class="row">
					<!-- 왼쪽 영역 : col-md-3 -->
					<div class="col-md-3">

						<!-- 일정 목록 : 밑에서 일정추가하면 여기로 목록이 생겨서 그 아이템 끌어다가 캘린더로 가져가주면 일정에 추가된다. -->
						<div class="box box-primary">
							<div class="box-header">
								<h6 class="box-title">[추가할 일정 목록]</h6>
							</div>
							<div class="box-body">
								<!-- the events -->
								<div id='external-events'></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->

						<!-- 일정 추가 box  -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">[일정 추가]</h3>
							</div>
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<button type="button" id="color-chooser-btn"
										class="btn btn-danger btn-block btn-sm dropdown-toggle"
										data-toggle="dropdown">
										Color <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" id="color-chooser">
										<li><a class="text-green" href="#"><i
												class="fa fa-square"></i> Green</a></li>
										<li><a class="text-blue" href="#"><i
												class="fa fa-square"></i> Blue</a></li>
										<li><a class="text-navy" href="#"><i
												class="fa fa-square"></i> Navy</a></li>
										<li><a class="text-yellow" href="#"><i
												class="fa fa-square"></i> Yellow</a></li>
										<li><a class="text-orange" href="#"><i
												class="fa fa-square"></i> Orange</a></li>
										<li><a class="text-aqua" href="#"><i
												class="fa fa-square"></i> Aqua</a></li>
										<li><a class="text-red" href="#"><i
												class="fa fa-square"></i> Red</a></li>
										<li><a class="text-fuchsia" href="#"><i
												class="fa fa-square"></i> Fuchsia</a></li>
										<li><a class="text-purple" href="#"><i
												class="fa fa-square"></i> Purple</a></li>
									</ul>
								</div>
								<!-- /btn-group -->
								<div class="input-group">
									<!-- 일정 제목 입력란 -->
									<input id="new-event" type="text" class="form-control"
										placeholder="Title">
									<!-- 일정 내용 입력란 -->
									<!-- 변경해야되는것 . ################## 내용 전달되도록(week/day에서 확인가능).   기본 크기 늘려주고 /  자동 스크롤될 수 있도록 설정하기. ############################# -->
									<input id="new-event1" type="text" class="form-control"
										placeholder="content">


								</div>
								<!-- /input-group -->
								<div class="input-group">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-default btn-flat">Add</button>
									</div>
									<!-- /btn-group -->
									<!-- 변경해야되는것 . #################  체크되면 부서일정으로 전달되도록.   부서일정/개인일정 체크하는 input  ####################### -->
									<p>
										<input type='checkbox' id='check-public' /> <label
											for='check-public'>부서 일정</label>
									</p>
								</div>
								<!-- /input-group -->

							</div>
						</div>
					</div>
					<!-- /.col -->

					<!-- 오른쪽 달력 영역 : col-md-9 -->
					<div class="col-md-9">
						<div class="box box-primary">
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
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
	<script src="//code.jquery.com/ui/1.11.1/jquery-ui.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/company/resources/js/AdminLTE/demo.js"
		type="text/javascript"></script>
	<!-- fullCalendar -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.0.2/fullcalendar.min.js"
		type="text/javascript"></script>
	<!-- Page specific script -->

	<script type="text/javascript">
		$(function() {

			/* initialize the external events
			 -----------------------------------------------------------------*/
			function ini_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title

					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag

					});

				});
			}
			ini_events($('#external-events div.external-event'));

			/* initialize the calendar
			 -----------------------------------------------------------------*/

			//Date for the calendar events (dummy data)
			var date = new Date();
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();

			$('#calendar').fullCalendar(
					{
						header : {
							left : 'prev,next today',
							center : 'title',
						//   right: 'month'//,agendaWeek,agendaDay'
						},
						buttonText : {
							today : 'today',
						//  month: 'month',
						//   week: 'week',
						//   day: 'day'
						},
						//Random default events
						events : [

						],
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar !!!
						drop : function(date, allDay) { // this function is called when something is dropped

							// retrieve the dropped element's stored Event Object
							var originalEventObject = $(this).data(
									'eventObject');

							// we need to copy it, so that multiple events don't have a reference to the same object
							var copiedEventObject = $.extend({},
									originalEventObject);

							// assign it the date that was reported
							copiedEventObject.start = date;
							copiedEventObject.allDay = allDay;
							copiedEventObject.backgroundColor = $(this).css(
									"background-color");
							copiedEventObject.borderColor = $(this).css(
									"border-color");

							// render the event on the calendar
							// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
							$('#calendar').fullCalendar('renderEvent',
									copiedEventObject, true);

							$(this).remove();

						}
					});

			/* ADDING EVENTS */
			var currColor = "#f56954"; //Red by default
			//Color chooser button
			var colorChooser = $("#color-chooser-btn");
			$("#color-chooser > li > a").click(function(e) {
				e.preventDefault();
				//Save color
				currColor = $(this).css("color");
				//Add color effect to button
				colorChooser.css({
					"background-color" : currColor,
					"border-color" : currColor
				}).html($(this).text() + ' <span class="caret"></span>');
			});
			$("#add-new-event").click(function(e) {
				e.preventDefault();
				//Get value and make sure it is not null
				var val = $("#new-event").val();
				var val1 = $("#new-event1").val();
				if (val.length == 0) {
					return;
				}
				if (val1.length == 0) {
					return;
				}

				//Create events
				var event = $("<div />");
				event.css({
					"background-color" : currColor,
					"border-color" : currColor,
					"color" : "#fff"
				}).addClass("external-event");
				event.html(val);
				$('#external-events').prepend(event);

				//Add draggable funtionality
				ini_events(event);

				//Remove event from text input
				$("#new-event").val("");
				$("#new-event1").val("");

			});
		});
	</script>

</body>
</html>
