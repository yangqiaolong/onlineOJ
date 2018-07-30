<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>源代码在线编译系统教师登陆界面</title>
	<link rel="SHORTCUT ICON" href="static/image/logo.png">
		<link rel="BOOKMARK" href="static/image/logo.png">
			<link href="static/css/bootstrap.min.css" rel="stylesheet">
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
				<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	background: #444 url("static/img/loginBg.png");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: center center;
}

#content {
	position: absolute;
	top: 50%;
	height: 300px;
	margin-top: -150px;
	width: 100%;
	text-align: center;
}

#title {
	position: relative;
	top: -32%;
	display: inline-block;
	width: 300px;
	height: 100%;
	color: white;
	text-align: right;
	margin-right: 30px;
}

#round {
	width: 100px;
	height: 100px;
	border-radius: 50px 50px 50px 50px;
	background: rgba(55, 236, 186, 1);
	text-align: center;
	display: inline-block;
}

#round h3 {
	margin: 0;
	padding: 0;
	margin-top: 25px;
}

#form {
	position: relative;
	background: rgb(255, 255, 255);
	width: 300px;
	height: 100%;
	display: inline-block;
	margin-right: 180px;
	text-align: left;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 50px;
}

#form div div {
	padding-bottom: 20px;
}

#submitButton {
	width: 100%;
}

#author {
	color: black;
	position: absolute;
	bottom: 0;
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div id="content">
		<div id="title">
			<h1>教师登陆</h1>
			<div id="round">
				<h3>
					用户<br>登录 
				</h3>
			</div>
		</div>
		<div id="form">
			<div class="form-group">
				
				<form action="log">
					<div>
					账号：
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div>密码：
					<input type="password" class="form-control" id="password" name="password">
					</div>
					<div>
						
					</div>
					<div>
					<button id="submitButton" class="btn btn-primary" type="submit">登陆</button>
					<p></p>
					<button type="button" id="forgetButton" style="width:260px" class="btn btn-primary"  data-toggle="modal" data-target="#forgetpwd">忘记密码</button>
					</div>
					
				</form>
			</div>

		</div>
	</div>
 <!-- 修改测试数据弹出框 开始-->
<div class="modal fade dialog" id="forgetpwd">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title">忘记密码</h4>
			</div>
			<div class="modal-body">
			   <form >				
					<center><div >账号</div></center>
					<center><div><input  type="text" id="mngid" name="mngid" /></div></center>
					<center><div >姓名</div></center>
					<center><div><input  type="text" id="name" name="name" /></div></center>
					<center><div>新密码</div></center>
					<center><div><input  type="text" id="password1" name="password1" /></div></center>
					<center><div >重复密码</div></center>
					<center><div ><input type="text" id="password2" name="password2" /></div></center>
					<center><div><button onclick="go()">提交</button>
					</div></center>	
					<script>
										function go() {
											
											var id = document
													.getElementById('mngid').value;
											var name = document
													.getElementById('name').value;
											var pwd = document
											.getElementById('password1').value;
											var pwdrepate = document
											.getElementById('password2').value;
											alert(pwd+":"+pwdrepate);
											if (pwd == pwdrepate) {
												$.ajax({
															type : 'POST',
															url : 'teaMngForget',
															data : {
																id : id,
																name:name,
																password : pwd,
																password2 : pwdrepate
															},
															async:false,
															success : function(data) {
																alert(data);
																if (data == "1") {
																	alert("修改成功");
																	window.location.reload();
																} else if (data == "0") {
																	alert("修改失败");
																}

															}
														});
											} else {
												alert("密码输入不一致");
											}

										}
									</script>			
			   </form>
			</div>
		</div>
	</div>
</div>
<!-- 测试数据详情弹出框 结束-->
</body>

</html>

</html>
