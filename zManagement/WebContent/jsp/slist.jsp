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
<form method="post" action="#" id="listform">
  <div class="panel admin-panel">
    
        <li>
         <div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath }/quepd.action?pd=2"><span class="icon-edit"></span>排序</a>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%" style="text-align:left; padding-left:20px;">课程ID</th>
        <th width="10%">老师姓名</th>
        <th width="30%">课程名称</th>
        <th width="20%">课程类型</th>
        <th width="10%">学分</th>
        <th width="20%">备注</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach var="st" items="${COUOSS.list}">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.cid}</td>
          <td>${(st.teacher).tname}</td>
          <td>${st.cname}</td>
          <td>${st.ctype}</td>
          <td>${st.ccredit}</td>
          <td>${st.cnote}</td>
          <td><div class="button-group"> <a class="button border-main" style="background:#E8E6E7" disabled="disabled" href="#"><span class="icon-edit"></span> 退学</a> </div></td>
        </tr>
        
        </c:forEach>
         <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/requiredcourse.action?current=1">首页</a> 
      	
        <a href="${pageContext.request.contextPath }/requiredcourse.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        <a href="${pageContext.request.contextPath }/requiredcourse.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        <a href="${pageContext.request.contextPath }/requiredcourse.action?current=${COUOSS.pages}">尾页</a>
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