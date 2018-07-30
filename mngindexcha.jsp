<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ch" ng-app="onlineJudgeApp">
<%
String  mngid=(String)session.getAttribute("mngid");
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/responsive.css" />
<link rel="stylesheet" type="text/css" href="static/css/animate.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/main.css" />
<script src="static/js/angular.min.js"></script>
<script src="static/js/angular-route.min.js"></script>
<script src="static/js/app.js"></script>
<script src="static/js/controllers.js"></script>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
			var itmeObj = $(".meun-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");
			;
			attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
		$("#topAD").click(function() {
			$("#topA").toggleClass(" glyphicon-triangle-right");
			$("#topA").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topBD").click(function() {
			$("#topB").toggleClass(" glyphicon-triangle-right");
			$("#topB").toggleClass(" glyphicon-triangle-bottom");
		});
		$("#topCD").click(function() {
			$("#topC").toggleClass(" glyphicon-triangle-right");
			$("#topC").toggleClass(" glyphicon-triangle-bottom");
		});
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		})
	})
</script>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="static/css/common1.css" />
<link rel="stylesheet" type="text/css" href="static/css/slide.css" />
<link rel="stylesheet" type="text/css"
	href="static/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="static/css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/css/jquery.nouislider.css">
</head>

<body>
	
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="后台管理" src="static/img/logo1.png"><span>后台管理</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="userName">${mngid}</p>
				<!--获取管理员的用户ID-->
				<p>
					<a href="mngLogOut">退出登录</a>
				</p>
			</div>
			<div class="meun-title">账号管理</div>

			<div  class="meun-item" onclick="intoStu()" aria-controls="stu" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_chara_grey.png" >学生管理
			</div>
			<div class="meun-item" onclick="intoTea()" aria-controls="tea" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_user_grey.png" >老师管理
			</div>
			<div class="meun-item" onclick="intoMng()" aria-controls="adm" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_user_grey.png" >管理员管理
			</div>
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->   
			
		
			<script>
					function CartController($scope) {
						$scope.items = ${info}
					}
					
					function intoStu(){
						window.location.href="stuMng";
					}
					function intoTea(){
						window.location.href="teaMng";
					}
					function intoMng(){
						window.location.href="admMng";
					}
					function intoChan(){
						window.location.href="chanMng";
					}
				</script>             
				<!-- 修改密码模块 -->
				<div role="tabpanel" class="tab-pane" id="chan">
					<div
						style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" id="chapwd"
										name="chapwd" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
								<div class="col-xs-5">
									<input type="" class="form-control input-sm duiqi" id="chapwd1"
										id="chapwd1" placeholder="" style="margin-top: 7px;">
								</div>
							</div>
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="reset" class="btn btn-xs btn-white">取 消</button>
									<button type="submit" class="btn btn-xs btn-green"
										onclick="chadmpwd()">保存</button>
									<script>
										function chadmpwd() {
											var admid = ${mngid};
											var pwd = document
													.getElementById('chapwd').value;
											var pwdrepate = document
													.getElementById('chapwd1').value;

											if (pwd == pwdrepate) {
												$.ajax({
															type : 'POST',
															url : 'mngChangePassword',
															data : {
																admid : admid,
																password : pwd
															},
															async:false,
															success : function(data) {
																alert(data);
																if (data == "OK") {
																	alert("修改成功");
																} else if (data == "NO") {
																	alert("修改失败");
																}

															}
														});
											} else {
												alert("密码输入不一致");
											}

										}
									</script>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
					
	<script src="static/js/jquery.nouislider.js"></script>

	<!-- this page specific inline scripts -->
	<script>
		//min/max slider
		function huadong(my, unit, def, max) {
			$(my).noUiSlider(
					{
						range : [ 0, max ],
						start : [ def ],
						handles : 1,
						connect : 'upper',
						slide : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
							console.log($(this).find(".noUi-handle").parent()
									.parent().html());
						},
						set : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
						}
					});
			$(my).val(def, true);
		}
		huadong('.slider-minmax1', "分钟", "5", 30);
		huadong('.slider-minmax2', "分钟", "6", 15);
		huadong('.slider-minmax3', "分钟", "10", 60);
		huadong('.slider-minmax4', "次", "2", 10);
		huadong('.slider-minmax5', "天", "3", 7);
		huadong('.slider-minmax6', "天", "8", 10);
	</script>
</body>

</html>