<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>权限管理 - 权限列表</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/static/css/layout.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/zTree/css/demo.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/zTree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript">
	var setting = {

		check : {
			enable : true,
			chkStyle : "radio", //单选框
			radioType : "all" //对所有节点设置单选
		},

		/* check:{//使用复选框
		   enable:true
		}, */
		data : {
			simpleData : {//是否使用简单数据模式
				enable : true
			}
		},
		callback : {
			onCheck : onCheck
		},
		view : {
			fontCss : setFontCss
		}

	};

	//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中        
	/* var zNodes = [
	    { id:1, pId:0, name:"随意勾选 1", open:false},
	    { id:11, pId:1, name:"随意勾选 1-1", open:true},
	    { id:111, pId:11, name:"随意勾选 1-1-1"},
	    { id:112, pId:11, name:"随意勾选 1-1-2",checked:true},
	    { id:12, pId:1, name:"随意勾选 1-2", open:true},
	    { id:121, pId:12, name:"随意勾选 1-2-1"},
	    { id:122, pId:12, name:"随意勾选 1-2-2"},
	    { id:2, pId:0, name:"随意勾选 2",  open:false},
	    { id:21, pId:2, name:"随意勾选 2-1"},
	    { id:22, pId:2, name:"随意勾选 2-2", open:true},
	    { id:221, pId:22, name:"随意勾选 2-2-1"},
	    { id:222, pId:22, name:"随意勾选 2-2-2"},
	    { id:23, pId:2, name:"随意勾选 2-13"}
	]; */
	var zNodes = ${AUTHS};
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		$("#hideUrl").hide();
		$("#code").hide();
	});

	function setFontCss(treeId, treeNode) {
		return treeNode.state == 0 ? {
			color : "gray"
		} : {};
	};
	//选中单选框后触发事件
	function onCheck(treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo"), 
		nodes = treeObj.getCheckedNodes(true);
		console.log(nodes[0].authGrade);
		v = "";
		x = "";
		Y = "";
		//设置获取选中的复选框的值  
		for (var i = 0; i < nodes.length; i++) {
			v = nodes[i].name;
			x = nodes[i].desc;
			y = nodes[i].id;
			//alert(nodes[i].id); //获取选中节点的值
			/* $("#authIdInput").val(v); */
		}
		/* $("#authNameInputs").val(v)
		$("#descInputs").val(x)
		$("#useridby").val(y)
		$("#useridbys").val(y)
		console.log(v+"**"+x+"**"+Y);	 */

		for (var i = 0; i < nodes.length; i++) {
			//获取选中节点的权限级别值
			if (nodes.length == 0) {
				$("#hideUrl").hide();
				$("#code").hide();
			}

			//获取选中节点的权限级别值
			if (nodes[i].authGrade == 3) {
				$("#grade option:eq(2)").removeAttr("disabled");
				$("#grade option:lt(2)").attr("disabled", "disabled");
				$("#grade option:eq(2)").attr("selected", true);
				$("#hideUrl").show();
				$("#code").show();
			}
			if (nodes[i].authGrade == 2) {
				$("#grade option:eq(2)").removeAttr("disabled");
				$("#grade option:lt(2)").attr("disabled", "disabled");
				$("#grade option:gt(2)").attr("disabled", "disabled");
				$("#grade option:eq(2)").attr("selected", true);
				$("#hideUrl").show();
				$("#code").show();
			}
			if (nodes[i].authGrade == 1) {
				$("#grade option:eq(1)").removeAttr("disabled");
				$("#grade option:gt(1)").attr("disabled", "disabled");
				$("#grade option:lt(1)").attr("disabled", "disabled");
				$("#grade option:eq(1)").attr("selected", true);
				$("#hideUrl").show();
				$("#code").hide();
			}

		}

	};

	//请求添加权限 
	$(function() {/* 添加权限验证name*/
		var flag = true;
		var urll = true;
		var codel = true;
		$("#authNameInput1").blur(
			function() {
				var an = $("#authNameInput1").val();
				if (!!an) {
				$.ajax({
					type : "POST", //请求方式 
					url : "${pageContext.request.contextPath}/Auth/addAuthname.action",
					dataType : "json", //返回数据类型
					data : {//请求参数
					name : an
					},
			success : function(data) { //请求成功后
			if (data.msg == '0') {
			$("#authNameInput1Label").removeClass("red").css("color","green").html("权限名可用!");
			flag = true;
			} else {
				$("#authNameInput1Label").removeClass("green").css("color", "red").addClass("red").html("权限名已被占用!");
					flag = false;
					}
					},
				error : function() {
				alert("系统出现异常！");
					}
				});
							} else {
								$("#authNameInput1Label").removeClass("green")
										.css("color", "red").addClass("red")
										.html("权限名不能为空");
								flag = false;
							}
						});

		$("#authURL1").blur(
			function() {
			var an = $("#authURL1").val();
				if (!!an) {
					$.ajax({
						type : "POST", //请求方式 
						url : "${pageContext.request.contextPath}/Auth/addAuthname.action",
						dataType : "json", //返回数据类型
						data : {//请求参数
						url : an
						},
						success : function(data) { //请求成功后
						if (data.msg == '0') {
						$("#authURL1Label")
						.removeClass("red")
							.css("color","green").html("url可用!");
								urll = true;
								} else {
													$("#authURL1Label")
															.removeClass(
																	"green")
															.css("color", "red")
															.addClass("red")
															.html("url名已被占用!");
													urll = false;
												}
											},
											error : function() {
												alert("系统出现异常！");
											}
										});
							} else {
								$("#authURL1Label").removeClass("green").css(
										"color", "red").addClass("red").html(
										"URl不能为空");
								urll = false;
							}

						});

		$("#codeInput1")
				.blur(
						function() {
							var an = $("#codeInput1").val();
							if (!!an) {
								$
										.ajax({
											type : "POST", //请求方式 
											url : "${pageContext.request.contextPath}/Auth/addAuthname.action",
											dataType : "json", //返回数据类型
											data : {//请求参数
												code : an
											},
											success : function(data) { //请求成功后
												if (data.msg == '0') {
													$("#codeInput1Label")
															.removeClass("red")
															.css("color",
																	"green")
															.html("code名可用!");
													codel = true;
												} else {
													$("#codeInput1Label")
															.removeClass(
																	"green")
															.css("color", "red")
															.addClass("red")
															.html("code名已被占用!");
													codel = false;
												}
											},
											error : function() {
												alert("系统出现异常！");
											}
										});
							} else {
								$("#codeInput1Label").removeClass("green").css(
										"color", "red").addClass("red").html(
										"code不能为空");
								codel = false;
							}

						});

		$("#checkons").click(function() {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var url = "";
			authidd = "";
			authId = "";
			nodes = treeObj.getCheckedNodes(true);
			for (var i = 0; i < nodes.length; i++) {
				authidd = nodes[i].pId
				authId = nodes[i].id;
			}
			var anme = $("#authNameInput1").val();
			var url = $("#authURL1").val();
			var desc = $("#descInput1").val();
			var Grade = $("#grade").val();
			var code = $("#codeInput1").val();

			if (!authId) {
				authId = "0";
				 authidd="0";
			}
			if (!!nodes[0]) {
				if (nodes[0].authGrade == 1 || nodes[0].authGrade == 2) {
					authidd = authId;
				}
				if (nodes[0].authGrade == 3) {
					authidd = authidd;
				}
			}
			console.log(Grade + "*等级*" + authidd + "父id" + authId + "点id");
			if (flag != false && urll != false && codel != false) {
				location.href="${pageContext.request.contextPath}/Auth/addAuth.action?anme="+anme+"&url="+url+"&desc="+desc+"&Grade="+Grade+"&authidd="+authidd+"&type="+Grade+"&code="+code;
			}
		});
	});

	//修改方法 
	$(function() {
		$("#upbutton")
				.click(
						function() {
							var treeObj = $.fn.zTree.getZTreeObj("treeDemo"), nodes = treeObj
									.getCheckedNodes(true), s = "";
							for (var i = 0; i < nodes.length; i++) {
								s = nodes[i].name;
								/* $("#authIdInput").val(v); */
							}
							$("#authNameInput").val(s);
						});
		$(".updateAuth")
				.click(
						function() {
							var treeObj = $.fn.zTree.getZTreeObj("treeDemo"), nodes = treeObj
									.getCheckedNodes(true), v = "";
							s = "";
							for (var i = 0; i < nodes.length; i++) {
								v += nodes[i].id;
								/* $("#authIdInput").val(v); */
							}
							var ad = $("#descInput").val();
							var authId = v;
							var an = $("#authNameInput").val();
							if (ad != '' && ad != '') {
								window.location.href = "${pageContext.request.contextPath}/Auth/updateAuth.action?ad="
										+ ad
										+ "&authId="
										+ authId
										+ "&an="
										+ an;
							} else {
								alert("输入不能为空！");

							}
						});

	});

	/* $(".delete-auth-submit").click(function(){ */
	function deleteAuth() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo"), nodes = treeObj
				.getCheckedNodes(true), v = "";
		for (var i = 0; i < nodes.length; i++) {
			v += nodes[i].id;
			/* $("#authIdInput").val(v); */
		}
		if (confirm('确认删除吗？')) {
			if (!!v) {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/Auth/reinAuth.action",
							type : "POST",
							data : {
								authIds : v,
								State : 0
							},
							success : function() {
								alert("删除成功");
								window.location.href = "${pageContext.request.contextPath}/Auth/findAuthIn.action";
							},
						});
			} else {
				alert("请选择要删除的权限");
			}
		}
	}
	/*恢复权限
	 */
	function reinAuth() {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo"), nodes = treeObj
				.getCheckedNodes(true), v = "";
		for (var i = 0; i < nodes.length; i++) {
			v += nodes[i].id;
			/* $("#authIdInput").val(v); */
		}
		if (!!v) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/Auth/reinAuth.action",
						type : "POST",
						data : {
							authIds : v,
							State : 1
						},
						success : function() {
							alert("恢复成功");
							window.location.href = "${pageContext.request.contextPath}/Auth/findAuthIn.action";
						},
					});
		} else {
			alert("请选择要恢复的权限");
		}
	}
</script>
</head>

<body>

	<!-- 头部 -->
	<jsp:include page="header.jsp" />

	<div class="container-fluid" style="margin-top: 30px;">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<jsp:include page="navibar.jsp" />
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">权限列表</h1>
				<div class="row placeholders">
					<!--添加权限表单 start-->
					<div>
						<button type="button" id="upbutton" class="btn btn-default show-add-form" style="width:100px;"
							data-toggle="modal" data-target="#update-auth-form-div">修改权限</button>
						<button type="button" style="width:100px;" class="btn btn-primary" data-toggle="modal" data-target="#rein-auth-form-div">恢复权限</button>
						<div class="modal fade " id="update-auth-form-div" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-md" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="role-form-title"></h4>
									</div>
									<div class="modal-body">
										<form class="role-form">

											<!-- <input type="text" name="authId" class="form-control" id="authIdInput"> -->
											<div class="form-group">
												<label for="authNameInput">名称</label> <input type="text"
													name="authName" class="form-control" id="authNameInput"
													placeholder="要修改的权限名称">
											</div>
											<div class="form-group">
												<label for="descInput">权限描述</label> <input type="text"
													name="authGrade" class="form-control" id="descInput"
													placeholder="要修改的权限描述">
											</div>

										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="button" class=" updateAuth  btn btn-primary role-submit"
											id="checkon" >提交</button>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade " id="rein-auth-form-div" tabindex="-1"
							role="dialog" aria-labelledby="mySmallModalLabel">
							<div class="modal-dialog modal-md" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="role-form-title">恢复权限</h4>
									</div>
									<div class="modal-body">
								<c:forEach items="${auth0}" var="auth0">
								<div><input type="checkbox" name="authId" value="${auth0.authId}"/>${auth0.authName}</div>
								</c:forEach>
							<button type="button" style="width:100px;" class="btn btn-primary" data-dismiss="modal" class="btn btn-default">取消</button>
							<button type="button" style="width:100px;" class="btn btn-primary" onclick="reinAuth()">提交</button>
						</div>
						</div>
					</div>
				</div>
				<div class="modal fade " id="role-form-div" tabindex="-1"
						role="dialog" aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-md" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="role-form-title"></h4>
								</div>
								<div class="modal-body">
									<form class="role-form">

										<!-- <input type="text" name="authId" class="form-control" id="authIdInput"> -->
										<div class="form-group" >
											<label for="authNameInput1">名称</label> <input type="text"
												name="authName" class="form-control" id="authNameInput1"
												placeholder="权限名称">
											<label id="authNameInput1Label" ></label> 
										</div>

										<div class="form-group">
											<label for="descInput1">权限描述</label> <input type="text"
												name="authDesc" class="form-control" id="descInput1"
												placeholder="权限描述">
										</div>

										<div class="form-group" id="hideUrl">
											<label for="authURL1">权限URL</label> <input type="text"
												name="authURL1" class="form-control" id="authURL1"
												placeholder="权限URL" /> 
												<label id="authURL1Label" ></label>
										</div>
										<div class="form-group" id="code">
												<label for="codeInput1">权限code</label> <input type="text"
													name="authCode" class="form-control" id="codeInput1"
													placeholder="权限代码">
													<label id="codeInput1Label" ></label>
											</div>
										
										<div class="form-group">
											<label for="descInput1">分类</label> 
											<select id="grade">
												<option value="1">模板</option>
												<option value="2" disabled="disabled">列表</option>
												<option value="3" disabled="disabled">按钮</option>
											</select>
										</div>

										
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary role-submit"
										id="checkons" >提交</button>
								</div>
							</div>
						</div>
					</div>
				</div>

					<!--添加权限表单 end-->
					<div class="space-div"></div>

					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree" style="width:1024px;"></ul>
					</div>
					<div class="space-div"></div>
					<div>
						<button type="button" class="btn btn-default show-add-form"
							data-toggle="modal" data-target="#role-form-div"
							style="width: 100px;">添加权限</button>
						<button type="button" style="width:100px;" class="btn btn-primary" onclick="deleteAuth()">删除权限</button>		
					</div>											
				</div>
			</div>
		</div>
	</div>

	<!-- 提示框 -->
	<div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">提示信息</h4>
				</div>
				<div class="modal-body" id="op-tips-content"></div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script
		src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

</body>
</html>
