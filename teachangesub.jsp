<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="teahead.jsp"%>
<style>
#problemContent {
	margin: 50px;
}

#userContent {
	margin: 50px;
}

p {
	word-break: break-all;
	display: inline-block;
}

#detailDialog {
	margin: 0;
	width: 100%;
}

#userContent .modal-dialog {
	width: 90%;
}

#userContent textarea {
	width: 90%;
}

#userContentCode {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 1px solid black;
	padding: 10px;
	max-height: 450px;
	overflow: scroll;
}
</style>
<script>
	function CartController($scope) {
		$scope.items = $
		{
			info
		}
	}
</script>
<div >
	<div class="panel panel-success">
		<div class="panel-heading">设置题目</div>
		<div class="panel-body">
			<form action="teaChangeSub" method="post">
				<center>
					<div>题号</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="problem_id"
							name="problem_id" value=${subInfo.problem_id } />
					</div>
				</center>
				<center>
					<div>题名</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="problem_name"
							name="problem_name" value=${subInfo.problem_name } />
					</div>
				</center>
				<center>
					<div>题目内容</div>
				</center>
				<center>
					<div>
						<textarea rows="6" cols="60" id="content" name="content">${subInfo.content }</textarea>
					</div>
				</center>
				<center>
					<div>时间限制</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="time_lim"
							name="time_lim" value=${subInfo.time_lim } />
					</div>
				</center>
				<center>
					<div>空间限制</div>
				</center>
				<center>
					<div>
						<input style="width: 500px" type="text" id="memory_lim"
							name="memory_lim" value=${subInfo.memory_lim } />
					</div>
				</center>
				<center>
					<div>
						<input type="submit" value="确定修改" />
					</div>
				</center>

			</form>
		</div>
	</div>
	<div class="panel panel-success">
		<div class="panel-heading">修改测试数据</div>
		<div ng-app="myApp" class="panel-body">
			<table id="tb1" ng-controller="CartController" border="1">
				<thead>
					<tr>
						<th class="col-md-1">测试数据序号</th>
						<th class="col-md-1">测试输入</th>
						<th class="col-md-1">测试输出</th>
						<th class="col-md-1">修改</th>
						<th class="col-md-1">删除</th>
					</tr>
				</thead>
				<tr ng-repeat="item in items">
					<td class="col-md-1">{{item.data_id}}</td>
					<td class="col-md-1"><pre>{{item.data_in}}</pre></td>
					<td class="col-md-1"><pre>{{item.data_out}}</pre></td>
					<td class="col-md-1">
						<button class="btn btn-success " onclick="detailclick(this)"
							data-toggle="modal" data-target="#detailtestdata">修改</button>
					</td>
					<td class="col-md-1">
						<button class="btn btn-success " onclick="changeclick(this)"
							>删除</button>
					</td>
				</tr>
				<tr>
				<center>
				<button class="btn btn-success " onclick="add()" data-toggle="modal" data-target="#testdata">增加</button>
	    		</center>
				</tr>
			</table>
			
			<script>
			function CartController($scope) {
				$scope.items = ${testdata}
			}
			    function add(){
			    	var problem_id=${subInfo.problem_id };
			    	document.getElementById('addproblem_id').value = problem_id;
			    }
				function detailclick(x) {
					//点击修改按钮将弹出框的数据初始化
					var problem_id=${subInfo.problem_id };
					var data_id = $(x.parentNode.parentNode).find("td").eq(0).text();
					document.getElementById('tproblem_id').value = problem_id;
					document.getElementById('data_id').value = data_id;
					alert(problem_id);
				}
				
				function changeclick(x) {
					var problem_id = ${subInfo.problem_id };
					//alert("aaa");
					var data_id = $(x.parentNode.parentNode).find("td").eq(0).text();//获取测试数据标号
					var con;
                	con=confirm("是否删除测试数据?");
                	if(con==true){
                		$.ajax({
		              		  type: 'POST',
		              		  url: 'teaDeleTestData',
		              		  data: {
		              			problem_id:problem_id,
		              			data_id:data_id
		              		  },
		              		  success: function(data){
		              			  if(data=="1"){
		              				alert("删除成功");
		              				window.location.reload();
		              			  }else if(data=="0"){
		              				alert("删除失败");
		              			  } 
		              			  
		              		  }
		              		});
                	}else{
                	}
				}
				

				
				
			</script>
		</div>
	</div>
</div>
		
    <!-- 修改测试数据弹出框 开始-->
<div class="modal fade dialog" id="detailtestdata">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title">修改测试数据</h4>
			</div>
			<div class="modal-body">
			   <form action="teaChangeTestData" method="post">				
					<center><div >题号</div></center>
					<center><div><input  style="width:500px" type="text" id="tproblem_id" name="tproblem_id" readonly="readonly"/></div></center>
					<center><div>测试数据序号</div></center>
					<center><div><input style="width:500px" type="text" id="data_id" name="data_id" readonly="readonly"/></div></center>
					<center><div >输入</div></center>
					<center><div ><textarea rows="3" cols="60" style="width:500px" type="text" id="data_in" name="data_in" ></textarea></div></center>
					<center><div >输出</div></center>
					<center><div ><textarea rows="3" cols="60" style="width:500px" type="text" id="data_out" name="data_out" ></textarea></div></center>
					<center><div><input type="submit" value="修改测试数据" />
					</div></center>					
			   </form>
			</div>
		</div>
	</div>
</div>
<!-- 测试数据详情弹出框 结束-->

<!-- 增加数据弹出框 开始-->
<div class="modal fade dialog" id="testdata">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title">增加测试数据</h4>
			</div>
			<div class="modal-body">
			   <form action="teaAddData" method="post">				
					<center><div >题号</div></center>
					<center><div><input  style="width:500px" type="text" id="addproblem_id" name="problem_id" readonly="readonly"/></div></center>
					<center><div >输入</div></center>
					<center><div ><textarea rows="3" cols="60" style="width:500px" type="text" id="adddata_in" name="data_in" ></textarea></div></center>
					<center><div >输出</div></center>
					<center><div ><textarea rows="3" cols="60" style="width:500px" type="text" id="adddata_out" name="data_out" ></textarea></div></center>
					<center><div><input type="submit" value="增加测试数据" />
					</div></center>					
			   </form>
			</div>
		</div>
	</div>
</div>
<!-- 修改数据弹出框 结束-->

