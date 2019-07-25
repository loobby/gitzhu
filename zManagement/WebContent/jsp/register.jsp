<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册页面</title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath }/register.action" method="post">
			用户名: <input type="text" name="id" onblur="isAvailable(this.value);"/>
				<label id="userError"></label>
			<br/><br/>
			密码: <input type="password" name="password" /><br/><br/>
			<input type="submit" value="注册" />
		</form>
<script type="text/javascript">
	var http;
	function isAvailable(id){
		http = new XMLHttpRequest();

		http.open("POST","${pageContext.request.contextPath}/Chaojlkhk.action")

		http.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

		http.onreadystatechange = callback;

		http.send("name="+id);
	}
	function callback(){
		//if(http.readyState==4 && http.status==200){
			var msg = http.responseText;
			console.log("*******"+msg);
			console.log(JSON.parse(msg)[0])
			/* if(msg=="true"){
				userError.innerHTML = "该账号可用";
				userError.style.color = "green";
			}else if(msg=="false"){
				userError.innerHTML = "该账号被占用";
				userError.style.color = "red";
			} */
	//}
}

</script>
			</body>
</html>