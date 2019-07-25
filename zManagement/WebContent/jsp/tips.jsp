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
  <div class="panel admin-panel">
    
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="5%" style="text-align:left; padding-left:20px;">学生ID</th>
        <th width="10%">学生姓名</th>
        <th width="15%">课程名称</th>
        <th width="10%">课程类型</th>
        <th width="5%">学生性别</th>
        <th width="5%">学生年龄</th>
        <th width="10%">学生电话</th>
        <th width="5%">得分</th>
        <th width="20%">备注</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach var="st" items="${COUOSS.list}">
      <form method="post" action="${pageContext.request.contextPath}/grade.action?sid=${st.sid}" id="listform">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.sid}</td>
           <td>${(st.student).sname}</td>
          <td>${(st.course).cname}</td>
          <td>${(st.course).ctype}</td>
          <td>${(st.student).ssex}</td>
          <td>${(st.student).sage}</td>
          <td>${(st.student).sphone}</td>
          <td><input type="text" placeholder="请打分" name="score" value="${st.score}" class="input" style="width:80px; line-height:15px;display:inline-block"/></td>
          <td>${(st.course).cnote}</td>
          <td><div class="button-group"> 
          <input type="submit" class="button border-main icon-search" value="打分"></div></td>
        </tr>
        </form>
        </c:forEach>
        <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/queryIts.action?current=1">首页</a> 
      	
      	
        <a href="${pageContext.request.contextPath }/queryIts.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        
      
        <a href="${pageContext.request.contextPath }/queryIts.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        
        <a href="${pageContext.request.contextPath }/queryIts.action?current=${COUOSS.pages}">尾页</a>
        </div></td>
      </tr> 
        
   		 <tr>
    </table>
  </div>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}
</script>
</body>
</html>