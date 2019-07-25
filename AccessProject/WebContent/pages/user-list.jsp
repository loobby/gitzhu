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
	
    <title>用户管理 - 用户列表</title>
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
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">用户列表</h1>
          <div class="row placeholders">
          <div id="lkk">
          <input type="text" name="userName" id="userCode" placeholder="搜索" value="${USER.userCode}"style="width:200px;height:30px;font-size=24px;">
            <select id="usertType"  style="width:150px;height:30px;font-size=24px;">
            	<option value="" ${USER.userType == null?'selected':'' } disabled selected hidden>用户类型</option>
            	<c:forEach items="${ROLE}" var="role">
                <option value="${role.roleName}" ${role.roleId eq USER.userType?'selected':''}>${role.roleName}</option>
                </c:forEach>
                <option value="">全部</option>
            </select>
             <select id="userState" style="width:100px;height:30px;font-size=24px;">
            	<option value="" ${USER.userState == null?'selected':'' }disabled selected hidden>用户状态</option>         
                <option value="1" ${USER.userState eq '1' ?'selected':''}>启用</option>
                <option value="0" ${USER.userState eq '0' ?'selected':''}>禁用</option>
                <option value="" ${USER.userState eq '3' ?'selected':''}>全部</option>
            </select>
            <button type="button" id="unbutt" class="btn btn-primary show-user-form">搜索</button>
          </div><br/>
          <script >
          $(function(){
        	  $("#unbutt").click(function(){
        		  var usercode = $("#userCode").val();
             	 var usertype=$("#usertType option:selected").val();
             	 var userstate=$("#userState option:selected").val();
             	  location.href="${pageContext.request.contextPath}/user/list.action?userCode="+usercode+"&userType="+usertype+"&userState="+userstate;
        	  });
        	  });
        	  </script>
         	<div>
                <button type="button" id="delete" class="btn btn-warning delete-query" data-toggle="modal" data-target="#delete-confirm-dialog">导出本页数据</button>
               	<button type="button" id="deletes" class="btn btn-warning delete-query" data-toggle="modal" data-target=" #delete-confirm-dialog ">导出全部数据</button>
                <!--  删除所选对话框 -->
                <div class="modal fade " id="delete-confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >警告</h4>
                      </div>
                      <div class="modal-body">
                        已经导出数据
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
<!--                         <button type="button" class="btn btn-primary delete-selected-confirm">确认</button>
 -->                      </div>
                    </div>
                  </div>
                </div>
                 <button type="button" class="btn btn-primary show-user-form" data-toggle="modal" data-target="#add-user-form">添加新用户</button>
               	          
               				
                <!--添加新用户表单-->
                
                <div class="modal fade " id="add-user-form" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >添加新用户</h4>
                      </div>
                      <div class="modal-body">
                      	<form class="user-form" action="${pageContext.request.contextPath}/user/adduserinfo.action" method="post">
                          <div class="form-group">
                            <label >用户名</label>
                            <input type="text" name="userCode" value="" class="form-control" id="userCodeInput" placeholder="用户名">
                          	<label id="userCodeError"></label>
                          </div>
                          <div class="form-group">
                            <label >昵称</label>
                            <input type="text" name="nickName" class="form-control" id="userNameInput"  placeholder="昵称">
                          </div>
                          <div class="form-group">
                            <label >部门</label>
                            <select name="groupId" id="userTypes" class="form-control"  >
				               <option  disabled selected hidden>用户类型</option>
				            	<c:forEach items="${UserGroup}" var="usergroup">
				                <option value="${usergroup.groupId}">${usergroup.groupName}</option>
				                </c:forEach>
				           </select>
                          </div>
                          <div class="form-group">
                            <label >密码</label>
                            <input type="password" name="userPwd" class="form-control" id="userPwdInput" placeholder="密码">
                          </div>
                          <div class="form-group">
                            <label for="passwordInput">确认密码</label>
                            <input type="password" name="userPwdConfirm" class="form-control" id="passwordInput" placeholder="确认密码">
                          </div>
                          <div class="modal-footer">
	                       <input type="reset" value="取消" class="btn btn-default" data-dismiss="modal"/>
	                       <input id="adduserinfo" type="submit" value="添加" class="btn btn-primary add-user-submit"/>
	                     </div>
                         </form>

                      </div>
                   
                    </div>
                  </div>
                </div>
                
            </div>
            <div class="space-div"></div>
            <table class="table table-hover table-bordered user-list">
            	<tr>
                	<td><input type="checkbox" class="select-all-btn"/></td>
                    <td>ID</td>
                    <td>用户名</td>
                    <td>昵称</td>
                    <td>部门</td>
                    <td>用户类型</td>
                    <td>用户状态</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>
                <!--  <tr>
                	<td><input type="checkbox" name="userIds" value="11"/></td>
                    <td class="userid">1</td>
                    <td class="username">sisu</td>
                    <td><a href="javascript:void(0);" class="show-user-roles" >查看所有角色</a></td>
                    <td>
                    	<a class="glyphicon glyphicon-wrench show-userrole-form" aria-hidden="true" title="修改所有角色" href="javascript:void(0);" data-toggle="modal" data-target="#update-userrole-dialog"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
                    </td>
                </tr>-->
                <c:forEach items="${page.resultList}" var="user">
                	<tr>
                		<td><input type="checkbox" name="userIds" value="${user.userId }"/></td>
                		<td class="userid">${user.userId }</td>
                		<td class="usercodes">${user.userCode}</td>
                		<td class="usernames">${user.nickName}</td>
                		<td class="usergroup">${(user.usergroup).groupName}</td>
                		
                		<td class="role">${(user.role).roleName}</td>
                		<c:if test="${user.userState eq 1}">
                		<td class="userState">启用</td>
                		</c:if>
                		<c:if test="${user.userState eq 0}">
                		<td class="userState"  style="color:#FF0000">禁用</td>
                		</c:if>
                		<td class="createTime">${user.createTime}</td>
	                    <td><a class="glyphicon glyphicon-wrench show-userrole-form  update-this-user" aria-hidden="true" title="修改所有角色" href="javascript:void(0);" data-toggle="modal" data-target="#update-userrole-dialog"></a>
                    	<a class="glyphicon glyphicon-remove delete-this-user" aria-hidden="true" title="删除用户" href="javascript:void(0);"></a>
                    	<button type="button"   class="btn btn-warning delete-query updatestate " >
	                    	${user.userState eq 1?"禁用":"启用"}
	                    	</button>
	                    	<c:if test="${user.userState eq 0}" > 
	                    	</c:if>
	                    	<c:if test="${user.userState eq 1}" > 
	                    	 <button   type="button"  class="btn btn-primary show-user-form czbutton" >重置密码</button>
	                    	 <button  id=""  type="button"  class="btn btn-primary show-user-form roleassignment" data-toggle="modal" data-target="#role-assignment-form">分配角色</button>
	                    	 <button type="button" class="btn btn-primary show-user-form   ggaiuserrole">更改权限</button>
	                    	</c:if>
	                    	
	                	</td>
                	</tr>
                </c:forEach>
            </table>
              <jsp:include page="standard.jsp"/>
            <!--修改用户角色表单-->
            <div class="modal fade " id="update-userrole-dialog" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                  <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" >修改用户角色</h4>
                      </div>
                      
                      <div class="modal-body">
                      	<form >
                      		用户ID<br></br>
                        	<input name="user" id="uid" type="text"  /><br></br>
                      		用户名<br></br>
                        	<input name="user" id="ucode" type="text" /><br></br>
                        	昵称<br></br>
                        	<input name="user" id="nname"  type="text" /><br></br>
                        	部门<br></br>
                        	  <select id="utype"  style="width:150px;height:30px;font-size=24px;">
				            	<option  id="utypess" disabled selected hidden>用户类型</option>
				            	<c:forEach items="${UserGroup}" var="usergroup">
				                <option value="${usergroup.groupId}">${usergroup.groupName}</option>
				                </c:forEach>
           				 </select>
                            <div class="roles-div"></div>
                        </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary update-userrole-submit">提交 </button>
                      </div>
                    </div>
                  </div>
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
                        <button type="button" class="btn btn-primary update-role-roleinfo">修改 </button>
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
    	function getAllRoles(obj){
        	obj.html("");
    		$.ajax({
				url:"listRoles.html",
				type:"POST",
				dataType:"json",
				success:function(data){
					for(var i in data){
						obj.append("<input type='checkbox' name='roleIds' value='"+
								data[i].roleId+"'/>"+data[i].roleName+":"+data[i].roleDesc);
						obj.append("<br/>");
					}
				}
			});
       	}
      
       	function showTips(content){
       		$("#op-tips-content").html(content);
			$("#op-tips-dialog").modal("show");
       	}
    	$(".select-all-btn").change(function(){
			if($(this).is(":checked")){//$(this).prop("checked")
				$(".user-list input[type='checkbox']:gt(0)").prop("checked",true);
			}else{
				$(".user-list input[type='checkbox']:gt(0)").prop("checked",false);
			}
		});
		$(".delete-selected-confirm").click(function(){
			$("#delete-confirm-dialog").modal("hide");
          	window.location.href="${pageContext.request.contextPath}/user/download.action";

		});
		
		
		
		
		
		
		$(".show-user-form").click(function(){
			getAllRoles($(".user-form .roles-div"));
		});
		
		
		
		
var flag=false;
$(function(){
			$("#userCodeInput").blur(function(){
			//请求添加新用户
				var userCode=$("#userCodeInput").val();
				if(!/^\w{4,16}$/.test(userCode)){
                 	$("#userCodeError").removeClass("green").css("color","red").addClass("red").html("用户不合法! 4-16位，字母，数字，下划线!");
					 }
			else{
			 $.ajax({
				 type:"POST", //请求方式 
	                url:"${pageContext.request.contextPath}/user/adduser.action",
	                dataType:"json", //返回数据类型
	                data:{//请求参数
	                	userCode:userCode
	                },
	                success:function(data){ //请求成功后
	                	if(data.msg=='0'){
                   	 	$("#userCodeError").removeClass("red").css("color","green").html("用户名可用!");
                    	flag=true;
 
	                	}else{
                     	$("#userCodeError").removeClass("green").css("color","red").addClass("red").html("用户名已被占用!");
                     	flag=false;
       
	                	}
	                },
	                error:function (){
	                	alert("系统出现异常！");
	                }   
			 }); 
			}
			});		
	});
		
		
		
		
		function getRolesByUserName(username,doSuccess){
			$.ajax({
				url:"showroles.html",
				data:{userName:username},
				type:"POST",
				dataType:"json",
				success:function(data){
					doSuccess(data);
				}
			});
		}
	
		$(".user-list").on("click",".show-user-roles",function(){
		
			var username=$(this).parents("tr").find(".username").html();
			var urTd=$(this).parent();
			//请求查看用户角色
			/*$.ajax({
				url:"showroles.html",
				data:{userName:username},
				type:"POST",
				dataType:"json",
				success:function(data){
					for(var i in data){
						var role=data[i].roleName+":"+data[i].roleDesc+"<br/>";
						urObj.append(role);
					}
				}
			});*/
			getRolesByUserName(username,function(data){
				urTd.html("");
				for(var i in data){
					var role=data[i].roleName+":"+data[i].roleDesc+"<br/>";
					urTd.append(role);
				}
			});
		});
		
		$(".user-list").on("click",".show-userrole-form",function(){
			var userid=$.trim($(this).parents("tr").find(".userid").text());
			var username=$(this).parents("tr").find(".username").html();
			$(".update-userrole-form input[name='userId']").val(userid);
			/* //获取当前用户当前角色
			getAllRoles($(".update-userrole-form .roles-div"));
			getRolesByUserName(username,function(data){
				for(var i in data){
					$('.update-userrole-form input[name="roleIds"][value="'+data[i].roleId+'"]').prop("checked",true);
				}
			}); */
		});

		$("#adduserinfo").click(function(){
			var userCodeError=$("#userCodeError").html();
			var userCodeInput=$("#userCodeInput").val();
			var userNameInput=$("#userNameInput").val();
			var userType=$("#userTypes option:selected").val();
			var userPwdInput=$("#userPwdInput").val();
			var passwordInput=$("#passwordInput").val();
			if(!/^\w{4,16}$/.test(userNameInput)){
				alert("昵称不合法! 4-16位，字母，数字，下划线");
				return false;
			}else if(!/^\w{4,16}$/.test(userCodeInput)){
				alert("用户不合法! 4-16位，字母，数字，下划线");
				return false;
			}
			else if(!flag){
				alert("用户名不合法! 4-16位，字母，数字，下划线");
               $("#userCodeError").removeClass("green").css("color","red").addClass("red").html("用户名不合规!");
				return false;
			}else if(userPwdInput.length>16 || userPwdInput.length<6){
			   alert("密码不合法! 6-16位，字母，数字");
				return false;
			}else if(userPwdInput!= passwordInput){
				   alert("两次密码不同");
					return false;
				}
			else if(userCodeError=='用户类型'){
				alert("选择用户类型");
				return false;
			}else
			{return true;}	
		});
		
		
		
		
		
		
		
		$(".user-list").on("click",".update-this-user",function(){//修改框给值
			var userTr=$(this).parents("tr");
			var userids=userTr.find(".userid").html()
			var usercodes=userTr.find(".usercodes").html();
			var usernames=userTr.find(".usernames").html();
			var  usergroup = userTr.find(".usergroup").html();
			var  usergroups = userTr.find(".usergroup").val();
			$("#uid").attr("disabled","disabled");
				$("#uid").val(userids)
				$("#ucode").val(usercodes)
				$("#nname").val(usernames)
				$("#utypess").html(usergroup)
				$("#utypess").val(usergroups)
		});
		//确认修改用户角色
		$(".update-userrole-submit").click(function(){
			var uid=$("#uid").val();
			var ucode=$("#ucode").val();
			var nname=$("#nname").val();
			var utype=$("#utype option:selected").val();
			if(ucode==null || ucode=='' || nname==null || nname==''){
				alert('请选择类型或名称不能空');
				return false;
				}
			else if(utype==null || utype==''){
				alert('修改类型相同请选择其他或取消');
				}
			else{   
				location.href="${pageContext.request.contextPath}/user/updateUser.action?userId="+uid+"&userCode="+ucode+"&nickName="+nname+"&groupId="+utype;
			}
		});
		//启用禁用用户
         $(function(){
        	  $(".updatestate").click(function(){
        		  var userTr=$(this).parents("tr");
      			var userid=userTr.find(".userid").html();

        		  var updates=$(this).html();
      			var update = $.trim(updates)
      			var state = update == "启用" ?0:1;
				location.href="${pageContext.request.contextPath}/user/stateUser.action?userId="+userid+"&stateid="+state;
        	  	});
        	  });
		$(".czbutton").click(function(){
			var userTr=$(this).parents("tr");
			var userid=userTr.find(".userid").html();
			if(confirm('确认重置ID为"'+userid+'"用户的密码吗？')){
				location.href="${pageContext.request.contextPath}/user/deleteuser.action?userid="+userid;
			}
		});
		//删除用户
		$(".user-list").on("click",".delete-this-user",function(){
			var userTr=$(this).parents("tr");
			var userid=userTr.find(".userid").html();
			if(confirm('确认删除ID为"'+userid+'"的用户吗？')){
				location.href="${pageContext.request.contextPath}/user/deleteUser.action?userid="+userid;
			}
		});
		
		
		
		 $(function(){//查看当前用户的角色 并✔
			$(".roleassignment").click(function(){
				var userTr=$(this).parents("tr");
				var usercodes=userTr.find(".usercodes").html();
				var userids=userTr.find(".userid").html()
				console.log(userids);
				$("#jiaoseF").attr("disabled","disabled");
				$("#jiaoseF").val(usercodes)
				 var userCode=$("#userCodeInput").val();
				 $.ajax({
					 type:"POST", //请求方式 
		                url:"${pageContext.request.contextPath}/user/findrole.action",
		                dataType:"json", //返回数据类型
        				data:{
        					userids:userids
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
			 $(".update-role-roleinfo").click(function(){
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
		                url:"${pageContext.request.contextPath}/user/updaterole.action",
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
		 $(".ggaiuserrole").click(function(){
			 var userTr=$(this).parents("tr");
				var userids=userTr.find(".userid").html()
          	window.location.href="${pageContext.request.contextPath}/user/changeuserauth.action?userid="+userids;
          	
			});
		

		 $("#delete").click(function() {
		 				if (confirm('你确定要导出数据吗')) {
		 					location.href = "${pageContext.request.contextPath}/user/download.action";
		 				}
		 			})
 		$("#deletes").click(function() {
		 				if (confirm('你确定要导出数据吗')) {
		 					location.href = "${pageContext.request.contextPath}/user/downloads.action";
		 				}
		 			}) 
    </script>
  </body>
</html>
