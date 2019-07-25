<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录页面</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
   <style type="text/css">
   	.red{color:red}
   </style>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
   <script type="text/javascript">	
   $(document).ready(function(){ //获取cookie    
		var userName = $.cookie("UserName");
       var pwd = $.cookie("pwd"); //获取cookie中的登陆密码    
       console.log(pwd);
       if(pwd){//密码存在的话把“记住用户名和密码”复选框勾选住    
          $("[name='rememberMe']").attr("checked","true");    
       }    
       if(pwd){//密码存在的话把密码填充到密码文本框    
          $("#inputPassword").val(pwd);   
       } 
       if(userName){//密码存在的话把密码填充到密码文本框    
           $("#inputEmail").val(userName);   
        }   
   });
   
    var flag=false;     	
	$(document).ready(function(){
		$("#submit").click(function(){	
		var vCode=$("#inputCode").val();
	 	 if(!!vCode){
	 	 	$.ajax({  
	                type:"POST", //请求方式 
	                url:"${pageContext.request.contextPath}/user/validCode.action",
	                dataType:"json", //返回数据类型
	                data:{//请求参数
	               		vCode:vCode
	                },
	                success:function(data){ //请求成功后
	                	if(data.msg=='1'){
	              			
	                      	flag=true;
                      	 	$("#error_html").removeClass("red").css("color","green").html("验证码正确!");
                      	 	login()
	                	}else{
                        	$("#error_html").removeClass("green").css("color","red").addClass("red").html("验证码不正确!");
                        	flag=false;
                       }
	                },
	                error:function (){
	                	alert("系统出现异常！");
	                }    
	         }); 
         }else{
           flag=false;
           alert("验证码不能为空")
         }
	} );
	
	});

	
	
	$(document).keyup(function(event){  //回车登陆
		  if(event.keyCode ==13){
		    $("#submit").trigger("click");
		  }
		});
	
	
	
	function login(){
		var userName=$("#inputEmail").val();//获取用户名
		var psw=$("#inputPassword").val();
		var vCode=$("#inputCode").val();
			if(!/^\w{3,16}$/.test(userName)){
				//alert("用户名不合法! 4-16位，字母，数字，下划线");
				$("#userNameError").addClass("red").text("用户名不合法! 4-16位，字母，数字，下划线");
				return false;
			}else if(psw.length>16 || psw.length<6){
			   alert("密码不合法! 6-16位，字母，数字");
				return false;
			}else if(!flag){
				alert("验证码不正确！");
				return false;
			}else{
				$.ajax({  
	                type:"POST",  
	                url:"${pageContext.request.contextPath}/user/login.action",
	                dataType:"json",  
	                data:{
	               		userPwd:psw,
	                	userCode:userName
	                },  
	                success:function(data){ 
	                  if(data.res=="1"){
		                   //登录成功
		                 var chc=$("input[name='rememberMe']").prop("checked"); 
		                  //判断checkbox是否被选中
		                  console.log(chc);
		                  if(chc){
		                	   $.cookie("UserName", userName, {expires: 7 });//调用jquery.cookie.js中的方法设置cookie中的用户名
                               $.cookie("pwd", psw, {expires:7});//调用jquery.cookie.js中的方法设置cookie中的登陆密码，并使用base64（jquery.base64.js）进行加密
		                  }else{
		                  	//清空
		                  	$.cookie("pwd", null);
		                  	$.cookie("UserName", null);
		                   }
	                 	window.location.href="${pageContext.request.contextPath}/Auth/index.action";
	                  }else if(data.res=="2"){
	                	  alert("该账户未审核");
	                	  return false; 
	                  }
	                  
	                  else{
	                  	alert("登录失败");
	                  	return false;
	                  }
	                },
	                error:function (){
	                   alert("系统错误！");
	                }   
         });
	}

	}
	
</script>
  </head>
  
  <body>
    	<form class="form-signin" method="post" action="##">
			<h3 class="form-signin-heading">请登录</h3>
			<label for="inputEmail" class="sr-only">用户名</label>
			<input type="text" id="inputEmail" class="form-control class123456" placeholder="用户名"  name="username" maxlength="20" value="" >
			 <label id="userNameError"></label>
			<label for="inputPassword" class="sr-only">密码</label>
			<input type="password"  id="inputPassword" class="form-control" placeholder="密码" name="password" maxlength="10">
		   
			<label for="inputEmail" class="sr-only" >验证码</label>
			<input type="text" id="inputCode" placeholder="验证码" name="code" tabindex="6" style="width:80px;text-transform:uppercase;ime-mode:disabled" maxlength="4">
			<img id="vdimgck"  src="${pageContext.request.contextPath}/pages/image.jsp?d="+new Date()+"" alt="看不清？点击更换" align="absmiddle" width="75" style="cursor:pointer" onclick="this.src=this.src+'?'" />
			<label id="error_html" style="font-size:18px;"></label>
		   <div class="checkbox" id="checkboxid" >
			  <label>
				<input type="checkbox" name="rememberMe" id="remember"> 记住我&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  </label>
			</div>
			<p class="bg-warning">${error}</p>
			<button  id="submit" class="btn btn-lg btn-primary btn-block" type="button" >登录</button>
     </form>
</body>
</html>
