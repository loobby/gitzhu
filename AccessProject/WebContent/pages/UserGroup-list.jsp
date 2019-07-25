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

    <title>用户管理 - 用户组列表</title>

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
          <h1 class="page-header">组列表</h1>
          <div class="row placeholders">
           <div id="lkk">
          <input type="text" name="groupName" id="groupName" placeholder="搜索" value="${USERGROUP.groupName}"style="width:200px;height:30px;font-size=24px;">
             <select id="groupState" style="width:100px;height:30px;font-size=24px;">
            	<option value="" ${USERGROUP.groupState == null?'selected':'' }disabled selected hidden>角色状态</option>         
                <option value="1" ${USERGROUP.groupState eq 1 ?'selected':''}>启用</option>
                <option value="0" ${USERGROUP.groupState eq 0 ?'selected':''}>禁用</option>
                <option value="" ${USERGROUP.groupState eq '3' ?'selected':''}>全部</option>
            </select>
            <button type="button" id="unbutt" class="btn btn-primary show-user-form">搜索</button>
          </div><br/>
           <script >
          $(function(){
        	  $("#unbutt").click(function(){
        		  var groupName = $("#groupName").val();
             	 var groupState=$("#groupState option:selected").val();
             	  location.href="${pageContext.request.contextPath}/group/findgroup.action?groupname="+groupName+"&groupstate="+groupState;
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
                            <label for="groupnameInput">名称</label>
                            <input type="text" name="groupname" class="form-control" id="groupnameInput" placeholder="组名">
                          <label id="groupnameError"></label>
                          </div>
                          <div class="form-group">
                            <label for="groupcodeInput">代码</label>
                            <input type="text" name="groupcode" class="form-control" id="groupcodeInput" placeholder="组代码">
                         <label id="groupcodeError"></label>
                          </div>
                          <div class="form-group">
                            <label for="groupdesc">描述</label>
                            
                            <input type="text" name="groupdesc" class="form-control" id="groupdescInput" placeholder="组描述">
                         	
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
                    <td>代码</td>
                     <td>描述</td>
                    <td>状态</td>
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
                <c:forEach items="${page.resultList}" var="usergrouplist">
	                <tr>
	                	<td><input type="checkbox" name="groupIds" value="${usergrouplist.groupId }"/></td>
	                    <td class="groupid">${usergrouplist.groupId }</td>
	                    <td class="groupName">${usergrouplist.groupName}</td>
	                    <td>${usergrouplist.groupCode }</td>
	                    <td>${usergrouplist.groupDesc }</td>
	                    <c:if test="${usergrouplist.groupState eq 1}">
                		<td class="groupState">启用</td>
                		</c:if>
                		<c:if test="${usergrouplist.groupState eq 0}">
                		<td class="groupState"  style="color:#FF0000">禁用</td>
                		</c:if>
                		
	                    <td><a class="upgroup glyphicon glyphicon-pencil show-roleinfo-form" aria-hidden="true" title="修改角色信息" href="javascript:void(0);" data-toggle="modal" data-target="#role-form-update"></a>
	                    	<a class="glyphicon glyphicon-remove delete-this-role" aria-hidden="true" title="删除角色" href="javascript:void(0);"></a>
	                    	<button type="button"   class="btn btn-warning delete-query updategroup " >
	                    	${usergrouplist.groupState eq 1?"禁用":"启用"}
	                    	</button>
	                    	<c:if test="${usergrouplist.groupState eq 0}" > 
	                    	</c:if>
	                    	<c:if test="${usergrouplist.groupState eq 1}" > 
	                    	<button  id=""  type="button"  class="btn btn-primary show-user-form roleassignment" data-toggle="modal" data-target="#role-assignment-form">分配角色</button>
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
                          <input type="hidden" name="groupId" class="form-control" id="groupIdInput">
                          <div class="form-group">
                            <label for="roleNameInput">名称</label>
                            <input type="text" name="groupName" class="form-control" id="groupNameupdate" placeholder="角色名">
                          <label id="groupNameError"></label>
                          </div>
                          <div class="form-group">
                            <label for="descInput">描述</label>
                            <input type="text" name="groupDesc" class="form-control" id="groupdescupdate" placeholder="角色描述">
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
    
    
    
    
    
    <div class="modal fade " id="role-assignment-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >分配角色</h4>
                      </div>
                      <div class="modal-body">
                      	<form class="user-form" action="${pageContext.request.contextPath}/user/adduserinfo.action" method="post">
                          <div class="form-group">
                            <label >用户名</label>
                            <input type="text"  value="" class="form-control" id="jiaoseF" placeholder="用户名">
                          	<label id="userCodeError"></label>
                          </div>
                          <input type="hidden" name="" id="userhidden">
                         <c:forEach var="role" items="${ROLE}">
                         ${role.roleName }<input type="checkbox" class="rolecheckbox" name="roleids" value=${role.roleId }
                         >
                         </c:forEach>

                          <div class="modal-footer">
	                       <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary update-group-roleinfo">修改 </button>
                        </div>
                         </form>

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
/* 		$(".delete-selected-confirm").click(function(){
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
		}); */

		$(function(){/* 添加组 */
			var flag=false;
			var faeg=false;
			$("#groupnameInput").blur(function(){
			console.log("adv");
				var groupnameInput=$("#groupnameInput").val();
			 $.ajax({
				 type:"POST", //请求方式 
	                url:"${pageContext.request.contextPath}/group/Groupname.action",
	                dataType:"json", //返回数据类型
	                data:{//请求参数
	                	name:groupnameInput
	                },
	                success:function(data){ //请求成功后
	                	if(data.msg=='0'){
                   	 	$("#groupnameError").removeClass("red").css("color","green").html("组名可用!");
                    	flag=true;
 
	                	}else{
                     	$("#groupnameError").removeClass("green").css("color","red").addClass("red").html("组名已被占用!");
                     	flag=false;
	                	}
	                },
	                error:function (){
	                	alert("系统出现异常！");
	                }   
			 }); 
			
			});	
			$("#groupcodeInput").blur(function(){
				console.log("adv");
					var groupcodeInput=$("#groupcodeInput").val();
					if(!/^\w{4,16}$/.test(groupcodeInput)){
						faeg=false;
	                 	$("#groupcodeError").removeClass("green").css("color","red").addClass("red").html("用户不合法! 4-16位，字母，数字，下划线!");
						 }
					else{
				 $.ajax({
					 type:"POST", //请求方式 
		                url:"${pageContext.request.contextPath}/group/Groupcode.action",
		                dataType:"json", //返回数据类型
		                data:{//请求参数
		                	code:groupcodeInput
		                },
		                success:function(data){ //请求成功后
		                	if(data.msg=='0'){
	                   	 	$("#groupcodeError").removeClass("red").css("color","green").html("组名可用!");
	                   	 	faeg=true;
	 
		                	}else{
	                     	$("#groupcodeError").removeClass("green").css("color","red").addClass("red").html("组已被占用!");
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
				var name=$("#groupnameInput").val();
				var code=$("#groupcodeInput").val();
				var desc=$("#groupdescInput").val();
				console.log(desc)
				if(!flag){
					alert("组名不合法");
					return false;
				}else if(!faeg){
					alert("code不合法! 4-16位，字母，数字，下划线");
					return false;
				}
				else{
                 window.location.href="${pageContext.request.contextPath}/group/addGroup.action?code="+code+"&Name="+name+"&desc="+desc;
					return false;}
			});	
	});
		
		
		
		$(function(){/* 修改用户 */
			var groupid=null;
		$(".upgroup").click(function(){
			var groupTr=$(this).parents("tr");
			var groupName=groupTr.find(".groupName").text();
			groupid=groupTr.find(".groupid").text();
			$("#groupNameupdate").attr("disabled","disabled");
			$("#groupNameupdate").val(groupName);
		});	
		$("#updaterole").click(function(){
			
			var groupdesc=$("#groupdescupdate").val();
			window.location.href="${pageContext.request.contextPath}/group/updategroup.action?desc="+groupdesc+"&id="+groupid;
		});	
		
});
	
		
		//启用禁用用户
        $(function(){
       	  $(".updategroup").click(function(){
       		var groupTr=$(this).parents("tr");
			var groupid=groupTr.find(".groupid").text();

       		  var updates=$(this).html();
     			var update = $.trim(updates)
     			
     			
     			var state = (update == "启用"?1:0);
     			console.log(state+"**"+groupid)
				location.href="${pageContext.request.contextPath}/group/stategroup.action?id="+groupid+"&stateid="+state;
       	  	});
       	  });
      //请求删除该用户
		$(".role-list").on("click",".delete-this-role",function(){
			var groupTr=$(this).parents("tr");
			var groupid=groupTr.find(".groupid").text();
			if(confirm('确认删除ID为"'+groupid+'"的角色吗？')){
				location.href="${pageContext.request.contextPath}/group/deletegroup.action?id="+groupid;
			}
		});
      
		 $(function(){//查看当前用户的角色 并✔
				$(".roleassignment").click(function(){
					var groupTr=$(this).parents("tr");
					var groupName=groupTr.find(".groupName").html();
					var groupid=groupTr.find(".groupid").text();
					console.log(groupid);
					$("#jiaoseF").attr("disabled","disabled");
					$("#jiaoseF").val(groupName)
					 $.ajax({
						 type:"POST", //请求方式 
			                url:"${pageContext.request.contextPath}/group/findgrouprole.action",
			                dataType:"json", //返回数据类型
	        				data:{
	        					groupid:groupid
	        				},
					 success:function(date){
						 $("[name = roleids]:checkbox").attr("checked", false);
						 var roles = date.split(",");
						 for (var i = 0; i < roles.length; i++) {
				                var info = roles[i];                
				                //让匹配的value值被选中
								$("input[name='roleids']").each(function(){
									if($(this).val()==info){
										$(this).prop("checked",true);
									}
								})
				            }
					 }    
				 });
				});		
				 $(".update-group-roleinfo").click(function(){
						if(confirm('确认修改吗？')){
						}
						var chid="";
						$("input[name='roleids']").each(function(){ //遍历所有复选框
							    if ($(this).prop('checked') == true) {
							        console.log($(this).val()); //打印当前选中的复选框的值
							    chid=chid+$(this).val()+",";
								}
							console.log(chid);
							});
						$.ajax({  
			                type:"POST", //请求方式 
			                url:"${pageContext.request.contextPath}/group/updategrouprole.action",
			                dataType:"json", //返回数据类型
			                data:{//请求参数
			                	chid:chid
			                },
			                success:function(data){ //请求成功后
			                	alert('分配完成');
			                },
			                  
			         }); 
					});
		});
    </script>
  </body>
</html>
