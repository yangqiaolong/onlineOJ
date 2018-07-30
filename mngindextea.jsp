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
			<div class="meun-item-active" onclick="intoTea()" aria-controls="tea" role="tab"
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
				<!-- 学生管理模块 -->
				<div role="tabpanel" class="tab-pane" id="stu">
				
					<div class="check-div">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addtea">添加老师</button>
					</div>
					<div class="data-div">
						<div class="panel-body">
							<table class="table table-striped" ng-controller="CartController">
								<thead>
									<tr>
										<th class="col-md-1">账号</th>
										<th class="col-md-1">姓名</th>
										<th class="col-md-1">修改</th>
										<th class="col-md-1">删除</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="item in items">
										<td class="col-md-1">{{item.id}}</td>
										<td class="col-md-1">{{item.name}}</td>
										<td class="col-md-1"><button class="btn btn-success "
												id="btn1" onclick="changeset(this)" data-toggle="modal"
												data-target="#changetea">修改</button></td>
										<td class="col-md-1"><button class="btn btn-success "
												id="btn2" onclick="deleteset(this)" data-toggle="modal"
												data-target="#deletetea">删除</button></td>
										<script>
											function changeset(x) {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('teaid1').value = ID;
												var name = $(
														x.parentNode.parentNode)
														.find("td").eq(1)
														.text();
												document
														.getElementById('teaname1').value = name;
												
											}
											function deleteset(x) {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('teaid2').value = ID;
											}
										</script>
									</tr>
								</tbody>
							</table>
						</div>
						<!--增加老师弹出窗口-->
						<div class="modal fade" id="addtea" role="dialog"
							aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="gridSystemModalLabel">添加老师</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">账号：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaid" name="teaid" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">姓名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaname" name="teaname" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="addtea()">保 存</button>
										<script>
											function addtea() {
												alert("aa");
												var teaid = document
														.getElementById('teaid').value;
												var teaname = document
														.getElementById('teaname').value;
												
												alert(teaid+teaname);
												var con;
												con=confirm("是否添加老师?");
							                	if(con==true){
							                		$.ajax({
														type : 'POST',
														url : 'mngAddTea',
														data : {
															id : teaid,
															name : teaname
														},
														success : function(data) {
															if(data=="1"){
																alert("添加成功");
																window.location.reload();
															}else{
																alert("添加失败");
															}
															
														}
													});
							                	}
												
												
											}
										</script>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--修改权限弹出窗口-->
						<div class="modal fade" id="changetea" role="dialog"
							aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="gridSystemModalLabel">修改用户信息</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">账号：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaid1" name="teaid1" placeholder="" readonly="readonly">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">姓名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaname1" name="teaname1" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teapwd1" name="teapwd1" 
															placeholder="长度为6-20位的，数字或者英文字母"
															pattern="[a-zA-Z0-9]{6,20}" required>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="changetea()">保 存</button>
										<script>
											function changetea() {
												var teaid = document
														.getElementById('teaid1').value;
												var teaname = document
														.getElementById('teaname1').value;
												var teapwd = document
														.getElementById('teapwd1').value;
												
												$.ajax({
													type : 'POST',
													url : 'changeTea',
													data : {
														id : teaid,
														name : teaname,
														password : teapwd
													},
													success : function(data) {
														if(data=="1"){
															alert("修改成功");
															window.location.reload();
														}else{
															alert("修改失败");
														}
														
													}
												});
											}
										</script>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!--弹出删除权限警告窗口-->
						<div class="modal fade" id="deletetea" role="dialog"
							aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">用户ID：</label>
												<div class="col-xs-6 ">
													<input type="email" class="form-control input-sm duiqi"
														id="teaid2" name="teaid2" placeholder="" readonly="readonly">
												</div>
											</div>
											<div class="container-fluid">
												<center>确定要删除该权限？删除后不可恢复！</center>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-danger"
											onclick="deletetea()">确定</button>
										<script>
											function deletetea() {
												var teaid = document
														.getElementById('teaid2').value;
												$.ajax({
													type : 'POST',
													url : 'deleTea',
													data : {
														id : teaid
													},
													success : function(data) {
														if(data=="1"){
															alert("删除成功");
															window.location.reload();
														}else{
															alert("删除失败");
														}
														
													}
												});
											}
										</script>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

					</div>
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