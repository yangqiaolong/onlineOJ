<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ch">
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

			<div onclick="stu()" class="meun-item" href="#stu" aria-controls="stu" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_chara_grey.png" >学生管理
			</div>
			<div class="meun-item" href="#tea" aria-controls="tea" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_user_grey.png" onclick="tea()">老师管理
			</div>
			<div class="meun-item" href="#adm" aria-controls="adm" role="tab"
				data-toggle="tab">
				<img src="static/img/icon_user_grey.png" onclick="adm()">管理员管理
			</div>
			<script>
			
				function stu() {
					$.ajax({
						type : 'POST',
						url : 'mngGetStuInfo',
						data : {
							mark : "student"
						},
						asycn:true,
						success : function(data) {
							alert("加载学生数据成功");
							$scope.items=data;
							alert(item.id);
							
						}
					});
				}
				function tea() {
					$.ajax({
						type : 'POST',
						url : 'getView',
						data : {
							mark : "teacher"
						},
						success : function(data) {
							alert("加载老师数据成功");

						}
					});
				}
				function adm() {
					$.ajax({
						type : 'POST',
						url : 'getView',
						data : {
							mark : "admin"
						},
						success : function(data) {
							alert("加载管理员数据成功");
						}
					});
				}
				function CartController($scope,info) {
					$scope.items = $
					{
						info
					}
				}
			</script>
		</div>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 账号管理模块 -->

				<!-- 学生管理模块 -->
				<div role="tabpanel" class="tab-pane" id="stu">
				
					<div class="check-div">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addstu">添加学生</button>
					</div>
					<div class="data-div">
						<div class="panel-body">
							<table class="table table-striped" ng-controller="CartController">
								<thead>
									<tr>
										<th class="col-md-1">学号</th>
										<th class="col-md-1">姓名</th>
										<th class="col-md-1">修改</th>
										<th class="col-md-1">删除</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="item in items">
										<td class="col-md-2">{{item.id}}</td>
										<td class="col-md-2">{{item.name}}</td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn1" onclick="changeset(this)" data-toggle="modal"
												data-target="#changestu">修改</button></td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn2" onclick="deleteset(this)" data-toggle="modal"
												data-target="#deletestu">删除</button></td>
										<script>
											function changeset() {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('stuid1').value = ID;
											}
											function deleteset() {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('stuid2').value = ID;
											}
										</script>
									</tr>
								</tbody>
							</table>
						</div>
						<!--增加学生弹出窗口-->
						<div class="modal fade" id="addstu" role="dialog"
							aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="gridSystemModalLabel">添加学生</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stuid" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stuname" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stupwd" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="addstu()">保 存</button>
										<script>
											function addstu() {
												var stuid = document
														.getElementById('stuid');
												var stuname = document
														.getElementById('stuname');
												var stupwd = document
														.getElementById('stupwd');
												$.ajax({
													type : 'POST',
													url : 'addstu',
													data : {
														stuid : stuid,
														stuname : stuname,
														stupwd : stupwd
													},
													success : function(data) {
														alert("添加成功");
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

						<!--修改权限弹出窗口-->
						<div class="modal fade" id="changestu" role="dialog"
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
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stuid1" placeholder="" readonly="readonly">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stuname1" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="stupwd1" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="changestu()">保 存</button>
										<script>
											function changestu() {
												var stuid = document
														.getElementById('stuid1');
												var stuname = document
														.getElementById('stuname1');
												var stupwd = document
														.getElementById('stupwd1');
												$.ajax({
													type : 'POST',
													url : 'changestu',
													data : {
														stuid : stuid,
														stuname : stuname,
														stupwd : stupwd
													},
													success : function(data) {
														alert("修改成功");
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
						<div class="modal fade" id="deletestu" role="dialog"
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
														id="stuid2" placeholder="" readonly="readonly">
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
											onclick="deletestu()">确定</button>
										<script>
											function deletestu() {
												var stuid = document
														.getElementById('stuid2');
												$.ajax({
													type : 'POST',
													url : 'deletestu',
													data : {
														stuid : stuid
													},
													success : function(data) {
														alert("删除成功");
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
				<!--老师管理模块-->
				<div role="tabpanel" class="tab-pane" id="tea">
					<div class="check-div">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addtea">添加老师</button>
					</div>
					<div class="data-div">
						<div class="panel-body">
							<table class="table table-striped" ng-controller="CartController">
								<thead>
									<tr>
										<th class="col-md-1">老师ID</th>
										<th class="col-md-1">姓名</th>
										<th class="col-md-1">类别</th>
										<th class="col-md-1">修改</th>
										<th class="col-md-1">删除</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="item in items">
										<td class="col-md-2">{{item.id}}</td>
										<td class="col-md-2">{{item.name}}</td>
										<td class="col-md-2">{{item.typle}}</td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn1" onclick="changeteaset(this)" data-toggle="modal"
												data-target="#changetea">修改</button></td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn2" onclick="deleteteaset(this)" data-toggle="modal"
												data-target="#deletetea">删除</button></td>
										<script>
											function changeteaset() {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('teaid1').value = ID;
											}
											function deleteteaset() {
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
						<!--页码块-->
						<footer class="footer">
							<ul class="pagination">
								<li><select>
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
								</select> 页</li>
								<li class="gray">共20页</li>
								<li><i class="glyphicon glyphicon-menu-left"> </i></li>
								<li><i class="glyphicon glyphicon-menu-right"> </i></li>
							</ul>
						</footer>
						<!--增加权限弹出窗口-->
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
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaid" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaname" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teapwd" placeholder="">
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
												var teaid = document
														.getElementById('teaid');
												var teaname = document
														.getElementById('teaname');
												var teapwd = document
														.getElementById('teapwd');
												$.ajax({
													type : 'POST',
													url : 'addtea',
													data : {
														teaid : teaid,
														teaname : teaname,
														teapwd : teapwd
													},
													success : function(data) {
														alert("添加成功");
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
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaid1" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teaname1" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="teapwd1" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green">保
											存</button>
										<script>
											function changetea() {
												var teaid = document
														.getElementById('teaid1');
												var teaname = document
														.getElementById('teaname1');
												var teapwd = document
														.getElementById('teapwd1');
												$.ajax({
													type : 'POST',
													url : 'addstu',
													data : {
														teaid : teaid,
														teaname : teaname,
														teapwd : teapwd
													},
													success : function(data) {
														alert("修改成功");
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
														id="teaid2" placeholder="" readonly="readonly">
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
														.getElementById('teaid2');
												$.ajax({
													type : 'POST',
													url : 'deletestu',
													data : {
														teaid : teaid
													},
													success : function(data) {
														alert("删除成功");
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
				<!--管理员管理窗口-->
				<div role="tabpanel" class="tab-pane" id="adm">
					<div class="check-div">
						<button class="btn btn-yellow btn-xs" data-toggle="modal"
							data-target="#addadm">添加管理员</button>
					</div>
					<div class="data-div">
						<div class="panel-body">
							<table class="table table-striped" ng-controller="CartController">
								<thead>
									<tr>
										<th class="col-md-1">编号</th>
										<th class="col-md-1">姓名</th>
										<th class="col-md-1">类别</th>
										<th class="col-md-1">修改</th>
										<th class="col-md-1">删除</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="item in items">
										<td class="col-md-2">{{item.id}}</td>
										<td class="col-md-2">{{item.name}}</td>
										<td class="col-md-2">{{item.typle}}</td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn1" onclick="changeadmset(this)" data-toggle="modal"
												data-target="#changestu">修改</button></td>
										<td class="col-md-2"><button class="btn btn-success "
												id="btn2" onclick="deleteadmset(this)" data-toggle="modal"
												data-target="#deletestu">删除</button></td>
										<script>
											function changeadmset() {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('admid1').value = ID;
											}
											function deleteadmset() {
												var ID = $(
														x.parentNode.parentNode)
														.find("td").eq(0)
														.text();
												document
														.getElementById('admid2').value = ID;
											}
										</script>
									</tr>
								</tbody>
							</table>
						</div>
						<!--页码块-->
						<footer class="footer">
							<ul class="pagination">
								<li><select>
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
								</select> 页</li>
								<li class="gray">共20页</li>
								<li><i class="glyphicon glyphicon-menu-left"> </i></li>
								<li><i class="glyphicon glyphicon-menu-right"> </i></li>
							</ul>
						</footer>
						<!--增加权限弹出窗口-->
						<div class="modal fade" id="addadm" role="dialog"
							aria-labelledby="gridSystemModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="gridSystemModalLabel">添加管理员</h4>
									</div>
									<div class="modal-body">
										<div class="container-fluid">
											<form class="form-horizontal">
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admid" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admname" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admpwd" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="addadm()">保 存</button>
										<script>
											function addadm() {
												var admid = document
														.getElementById('admid');
												var admname = document
														.getElementById('admname');
												var admpwd = document
														.getElementById('admpwd');
												$.ajax({
													type : 'POST',
													url : 'addadm',
													data : {
														admid : admid,
														admname : admname,
														admpwd : admpwd
													},
													success : function(data) {
														alert("添加成功");
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

						<!--修改权限弹出窗口-->
						<div class="modal fade" id="changeadm" role="dialog"
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
													<label for="sName" class="col-xs-3 control-label">用户ID：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admid1" placeholder="" readonly="readonly">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户名：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admname1" placeholder="">
													</div>
												</div>
												<div class="form-group ">
													<label for="sName" class="col-xs-3 control-label">用户密码：</label>
													<div class="col-xs-6 ">
														<input type="email" class="form-control input-sm duiqi"
															id="admpwd1" placeholder="">
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-xs btn-white"
											data-dismiss="modal">取 消</button>
										<button type="button" class="btn btn-xs btn-green"
											onclick="changeadm()">保 存</button>
										<script>
											function changeadm() {
												var admid = document
														.getElementById('admid1');
												var admname = document
														.getElementById('admname1');
												var admpwd = document
														.getElementById('admpwd1');
												$.ajax({
													type : 'POST',
													url : 'changeadm',
													data : {
														admid : admid,
														admname : admname,
														admpwd : admpwd
													},
													success : function(data) {
														alert("修改成功");
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
						<div class="modal fade" id="deleteadm" role="dialog"
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
														id="admid2" placeholder="" readonly="readonly">
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
											onclick="deleteadm()">确定</button>
										function deletestu(){ var admid =
										document.getElementById('admid2'); $.ajax({ type: 'POST', url:
										'deleteadm', data: { admid:admid }, success: function(data){
										alert("删除成功"); } }); }
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