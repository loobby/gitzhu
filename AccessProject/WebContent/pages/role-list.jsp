<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>用户管理 - 角色列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
 	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
  <style>

			.fuzzyQuery{
		width:130px;
		height:27px;
		}
		#lkk{
			margin-bottom:-50px;
			text-align:right;
		}

	</style>
  </head>

  <body>

    <!-- 头部 -->
    <jsp:include page="header.jsp"/>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <jsp:include page="navibar.jsp"/>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">角色列表</h1>
          <div class="row placeholders">
           <div id="lkk">
          <input type="text" name="roleName" id="roleName" placeholder="搜索" value="${ROLE.roleName}"style="width:200px;height:30px;font-size=24px;">
             <select id="roleState" style="width:100px;height:30px;font-size=24px;">
            	<option value="" ${ROLE.roleState == null?'selected':'' }disabled selected hidden>角色状态</option>         
                <option value="1" ${ROLE.roleState eq 1 ?'selected':''}>启用</option>
                <option value="0" ${ROLE.roleState eq 0 ?'selected':''}>禁用</option>
                <option value="" ${ROLE.roleState eq '3' ?'selected':''}>全部</option>
            </select>
            <button type="button" id="unbutt" class="btn btn-primary show-user-form">搜索</button>
          </div><br/>
           <script >
          $(function(){
        	  $("#unbutt").click(function(){
        		  var rolename = $("#roleName").val();
             	 var rolestate=$("#roleState option:selected").val();
             	 console.log(rolestate);
             	  location.href="${pageContext.request.contextPath}/Role/findlist.action?rolename="+rolename+"&roleState="+rolestate;
        	  });
        	  });
        	  </script>
          	<div>
            	<button type="button" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">删除所选</button>
           <!--       删除所选对话框
                <div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >警告</h4>
                      </div>
                      <div class="modal-body">
                        确认删除所选角色吗
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
                      </div>
                    </div>
                  </div>
                </div> -->
                
                
                
            	<button type="button" class="btn btn-default show-add-form" data-toggle="modal" data-target="#role-form-div">添加新角色</button>
                <!--添加新角色表单-->
                <div class="modal fade " id="role-form-div" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="role-form-title" ></h4>
                      </div>
                      <div class="modal-body">
                      <form class="user-form" action="${pageContext.request.contextPath}/Role/addrole.action"method="post">
                          <input type="hidden" name="roleId" class="form-control" id="roleIdInput">
                          <div class="form-group">
                            <label for="roleNameInput">名称</label>
                            <input type="text" name="roleName" class="form-control" id="roleNameInput" placeholder="角色名">
                          <label id="roleNameError"></label>
                          </div>
                          <div class="form-group">
                            <label for="descInput">描述</label>
                            <input type="text" name="roleDesc" class="form-control" id="descInput" placeholder="角色描述">
                          </div>
                          <div class="form-group">
                            <label for="codeInput">代码</label>
                            
                            <input type="text" name="roleCode" class="form-control" id="codeInput" placeholder="角色代码">
                         	<label id="rolecodeError"></label>
                          </div>
                        </form>
                      </div>
                      <div class="modal-footer">
                      
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                         <input id="addrole" type="submit" value="添加"  class="btn btn-primary add-user-submit"/>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="space-div"></div>
            <table class="table table-hover table-bordered role-list">
            	<tr>
                	<td><input type="checkbox" class="select-all-btn"/></td>
                    <td>ID</td>
                    <td>名称</td>
                    <td>描述</td>
                    <td>代码</td>
                    <td>状态</td>
                    <td>创建人</td>
                    <td>操作</td>
                </tr>
                <!--  <tr>
                	<td><input type="checkbox" name="roleIds"/></td>
                    <td class="roleid">11</td>
                    <td>用户管理员</td>
                    <td>用户管理</td>
                    <td>user_admin</td>
                    <td><a href="javascript:void(0);" class="show-role-perms" >查看所有权限</a></td>
                    <td><a class="glyphicon glyphicon-pencil show-roleinfo-form" aria-hidden="true" title="修改角色信息" href="javascript:void(0);" data-toggle="modal" data-target="#role-form"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-role" aria-hidden="true" title="删除角色" href="javascript:void(0);"></a></td>
                </tr>-->
                <c:forEach items="${page.resultList}" var="role">
	                <tr>
	                	<td><input type="checkbox" name="roleIds" value="${role.roleId }"/></td>
	                    <td class="roleid">${role.roleId }</td>
	                    <td class="roleName">${role.roleName}</td>
	                    <td>${role.roleDesc }</td>
	                    <td>${role.roleCode }</td>
	                    <c:if test="${role.roleState eq 1}">
                		<td class="userState">启用</td>
                		</c:if>
                		<c:if test="${role.roleState eq 0}">
                		<td class="userState"  style="color:#FF0000">禁用</td>
                		</c:if>
	                    <td>${(role.userInfo).getNickName()}</td>
	                    <td><a class="upRole glyphicon glyphicon-pencil show-roleinfo-form" aria-hidden="true" title="修改角色信息" href="javascript:void(0);" data-toggle="modal" data-target="#role-form-update"></a>
	                    	<a class="glyphicon glyphicon-remove delete-this-role" aria-hidden="true" title="删除角色" href="javascript:void(0);"></a>
	                    	<button type="button"   class="btn btn-warning delete-query updaterole " >
	                    	${role.roleState eq 1?"禁用":"启用"}
	                    	</button>
	                    	<c:if test="${role.roleState eq 0}" > 
	                    	</c:if>
	                    	<c:if test="${role.roleState eq 1}" > 
	                    	 <button type="button" class="btn btn-primary show-user-form   ggaiuserrole">更改权限</button>
	                    	</c:if>
	                    	
	                    	</td>
	                
	                
	                </tr>
                </c:forEach>
            </table>
            <jsp:include page="standard.jsp"/>
          </div>          
        </div>
      </div>
    </div>
    <!-- 修改表单 -->
       <div class="modal fade " id="role-form-update" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="role-form-title" ></h4>
                      </div>
                      <div class="modal-body">
                      <form class="user-form" action="${pageContext.request.contextPath}/Role/addrole.action"method="post">
                          <input type="hidden" name="roleId" class="form-control" id="roleIdInput">
                          <div class="form-group">
                            <label for="roleNameInput">名称</label>
                            <input type="text" name="roleName" class="form-control" id="roleNameupdate" placeholder="角色名">
                          <label id="roleNameError"></label>
                          </div>
                          <div class="form-group">
                            <label for="descInput">描述</label>
                            <input type="text" name="roleDesc" class="form-control" id="descupdate" placeholder="角色描述">
                          </div>
                        </form>
                      </div>
                      <div class="modal-footer">
                      
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                         <input id="updaterole" type="submit" value="修改"  class="btn btn-primary add-user-submit"/>
                      </div>
                    </div>
                  </div>
                </div>
	<!-- 提示框 -->
	<div class="modal fade" id="op-tips-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
        	<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >提示信息</h4>
          </div>
          <div class="modal-body" id="op-tips-content">
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script>
    	function showTips(contents){
    		$("#op-tips-content").html(contents);
			$("#op-tips-dialog").modal("show");
       	}
       	function resetRoleForm(title,button){
           	$(".role-form input[type='text']").val("");
			$(".role-form input[type='checkbox']").prop("checked",false);
       		$(".role-form-title").html(title);
			$(".role-submit").html(button);
      	}
       	function getAllPerms(obj){
        	obj.html("");
    		$.ajax({
				url:"listperms.html",
				type:"POST",
				dataType:"json",
				success:function(data){
					for(var i in data){
						obj.append('<input type="checkbox" name="permIds" value="'+
								data[i].permissionId+'"/>'+data[i].permissionDesc+':');
						if(data[i].isNavi===1){
							obj.append('<font color="red">导航结点</font>');
						}else{
							obj.append("非导航结点");
						}
						obj.append("<br/>");
					}
				}
			});
       	}
    	$(".select-all-btn").change(function(){
			if($(this).is(":checked")){//$(this).prop("checked")
				$(".role-list input[type='checkbox']:gt(0)").prop("checked",true);
			}else{
				$(".role-list input[type='checkbox']:gt(0)").prop("checked",false);
			}
		});
		$(".delete-selected-confirm").click(function(){
			$("#delete-confirm-dialog").modal("hide");
			var cbs=$("input[name='roleIds']:checked")
			if(cbs.length===0){
				showTips("没有选中任意项！");
			}else{
				var roleIds='';
				$.each(cbs,function(i,perm){
					//roleIds+=perm.value;
				});
				//请求删除所选角色
				$.ajax({
					url:"deletemore.html",
					data:{roleIds:roleIds},
					type:"POST",
					traditional:true,
					success:function(){
						cbs.parent().parent().remove();
						showTips("删除所选成功！");
					}
				});
			}
		});

		$(function(){/* 添加角色 */
			var flag=false;
			var faeg=false;
			$("#roleNameInput").blur(function(){
			console.log("adv");
				var roleNameInput=$("#roleNameInput").val();
			 $.ajax({
				 type:"POST", //请求方式 
	                url:"${pageContext.request.contextPath}/Role/rolename.action",
	                dataType:"json", //返回数据类型
	                data:{//请求参数
	                	name:roleNameInput
	                },
	                success:function(data){ //请求成功后
	                	if(data.msg=='0'){
                   	 	$("#roleNameError").removeClass("red").css("color","green").html("角色名可用!");
                    	flag=true;
 
	                	}else{
                     	$("#roleNameError").removeClass("green").css("color","red").addClass("red").html("角色名已被占用!");
                     	flag=false;
	                	}
	                },
	                error:function (){
	                	alert("系统出现异常！");
	                }   
			 }); 
			
			});	
			$("#codeInput").blur(function(){
				console.log("adv");
					var codeInput=$("#codeInput").val();
					if(!/^\w{4,16}$/.test(codeInput)){
						faeg=false;
	                 	$("#rolecodeError").removeClass("green").css("color","red").addClass("red").html("用户不合法! 4-16位，字母，数字，下划线!");
						 }
					else{
				 $.ajax({
					 type:"POST", //请求方式 
		                url:"${pageContext.request.contextPath}/Role/rolecode.action",
		                dataType:"json", //返回数据类型
		                data:{//请求参数
		                	code:codeInput
		                },
		                success:function(data){ //请求成功后
		                	if(data.msg=='0'){
	                   	 	$("#rolecodeError").removeClass("red").css("color","green").html("角色名可用!");
	                   	 	faeg=true;
	 
		                	}else{
	                     	$("#rolecodeError").removeClass("green").css("color","red").addClass("red").html("角色名已被占用!");
	                     	faeg=false;
		                	}
		                },
		                error:function (){
		                	alert("系统出现异常！");
		                }   
				 }); 
					}
				});	

			$("#addrole").click(function(){
				var codeInput=$("#codeInput").val();
				var roleNameInput=$("#roleNameInput").val();
				var descInput=$("#descInput").val();
				if(!flag){
					alert("角色名不合法");
					return false;
				}else if(!faeg){
					alert("code不合法! 4-16位，字母，数字，下划线");
					return false;
				}
				else{
                 	window.location.href="${pageContext.request.contextPath}/Role/addrole.action?code="+codeInput+"&roleName="+roleNameInput+"&desc="+descInput;
					return false;}
			});	
	});
		
		
		
		$(function(){	/*修改角色  */
		$(".upRole").click(function(){
			console.log("*****")
			var userTr=$(this).parents("tr");
			var roleNameupdate=userTr.find(".roleName").text();
			console.log(roleNameupdate)
			$("#roleNameupdate").attr("disabled","disabled");
			$("#roleNameupdate").val(roleNameupdate);
			var descInput=$("#descupdate").val();
		});	
		$("#updaterole").click(function(){
			var roleName=$("#roleNameupdate").val();
			var descInput=$("#descupdate").val();
             	window.location.href="${pageContext.request.contextPath}/Role/updaterole.action?desc="+descInput+"&roleName="+roleName;
		});	
		
});
	
		
		//启用禁用用户
        $(function(){
       	  $(".updaterole").click(function(){
       		  var userTr=$(this).parents("tr");
     			var roleid=userTr.find(".roleid").html();

       		  var updates=$(this).html();
     			var update = $.trim(updates)
     			
     			
     			var state = (update == "启用"?1:0);
     			console.log(state+"**"+roleid)
				location.href="${pageContext.request.contextPath}/Role/staterole.action?roleid="+roleid+"&stateid="+state;
       	  	});
       	  });
      //请求删除该用户
		$(".role-list").on("click",".delete-this-role",function(){
			var roleTr=$(this).parents("tr");
			var roleId=roleTr.find(".roleid").html();
			if(confirm('确认删除ID为"'+roleId+'"的角色吗？')){
				location.href="${pageContext.request.contextPath}/Role/deleterole.action?roleid="+roleId;
			}
		});
		$(function(){//更改权限
	       	  $(".ggaiuserrole").click(function(){
	       		  var userTr=$(this).parents("tr");
	     			var roleid=userTr.find(".roleid").html();

					location.href="${pageContext.request.contextPath}/Role/upRoleAuth.action?roleid="+roleid;
	       	  	});
	       	  });
    </script>
  </body>
</html>
