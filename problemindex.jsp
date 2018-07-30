<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
<style>
#problemContent {
	margin: 50px;
}
</style>
<div >
	
	<div class="panel panel-success">
		<div class="panel-heading">题目信息</div>
		<div class="panel-body">
			<table class="table table-striped" ng-controller="CartController">
				<thead>
					<tr>
						<th class="col-md-1">题号</th>
						<th class="col-md-1">题目名字</th>
						<th class="col-md-1">布题老师</th>
						<th class="col-md-1">选题</th>
					</tr>
				</thead>
				<tbody>
					<tr  ng-repeat="item in items">
						<td class="col-md-1">{{item.problem_id}}</td>
						<td class="col-md-1">{{item.problem_name}}</td>
						<td class="col-md-1">{{item.name}}</td>
						<td class="col-md-1"><button class="btn btn-success "
							 onclick="validate(this)">确定选择</button></td>
					</tr>
				</tbody>
				<script>
				function validate(x){
					var b=$(x.parentNode.parentNode).find("td").eq(0).text();
                	$.ajax({
              		  type: 'POST',
              		  url: 'SureChoose',
              		  data: {
              			problem_id:b
              		  },
              		  success: function(data){
              			  if(data=="1"){
              				alert("选题成功");
              			  }else if(data=="0"){
              				alert("对不起，你已经选择了该题");
              			  }
              			  
              		  }
              		});
				}
				</script>
				
				<script>
					function CartController($scope) {
						$scope.items = ${info}
					}
				</script>
			</table>
		</div>
		
	</div>
</div>
