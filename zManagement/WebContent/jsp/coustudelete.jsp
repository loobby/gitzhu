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
      <form method="post" action="" id="listform">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.sid}</td>
           <td>${(st.student).sname}</td>
          <td>${(st.course).cname}</td>
          <td>${(st.course).ctype}</td>
          <td>${(st.student).ssex}</td>
          <td>${(st.student).sage}</td>
          <td>${(st.student).sphone}</td>
          <td>${st.score}</td>
          <td>${(st.course).cnote}</td>
          <td><div class="button-group"> 
		 <a class="button border-red" href="${pageContext.request.contextPath }/deldtecourse.action?cid=${st.cid}&sid=${st.sid}" ><span class="icon-trash-o"></span> 删除</a>    
        </tr>
        </form>
        </c:forEach>
        <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/coustudelete.action?current=1">首页</a> 
      	
      	
        <a href="${pageContext.request.contextPath }/coustudelete.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        
      
        <a href="${pageContext.request.contextPath }/coustudelete.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        
        <a href="${pageContext.request.contextPath }/coustudelete.action?current=${COUOSS.pages}">尾页</a>
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