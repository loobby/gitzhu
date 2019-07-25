<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/keywords.action?curr=1" id="listform">
  <div class="panel admin-panel">
    
        <li>
          <a href="teaadd.jsp" class="button border-main icon-search">添加</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%" style="text-align:left; padding-left:20px;">课程ID</th>
        <th width="15%">老师姓名</th>
        <th width="10%">老师性别</th>
        <th width="10%">老师年龄</th>
        <th width="20%">老师电话</th>
        <th width="20%">老师邮箱</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach var="st" items="${COUOSS.list}">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.tid}</td>
          <td>${st.tname}</td>
          <td>${st.tsex}</td>
          <td>${st.tage}</td>
          <td>${st.tphone}</td>
          <td>${st.tmail}</td>
          <td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath }/updateteacher.action?tid=${st.tid}"><span class="icon-edit"></span>修改</a>
           <a class="button border-red" href="${pageContext.request.contextPath }/delectteacher.action?tid=${st.tid}" ><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        
        </c:forEach>
         <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/Checkteachers.action?current=1">首页</a> 
      	
        <a href="${pageContext.request.contextPath }/Checkteachers.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        <a href="${pageContext.request.contextPath }/Checkteachers.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        <a href="${pageContext.request.contextPath }/Checkteachers.action?current=${COUOSS.pages}">尾页</a>
        </div></td>
      </tr>
        
   		 <tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}
</script>
</body>
</html>