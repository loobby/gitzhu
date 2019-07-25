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
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    
        <li>
          <a href="couadd.jsp" class="button border-main icon-search">添加</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%" style="text-align:left; padding-left:20px;">科目ID</th>
        <th width="10%">老师id</th>
        <th width="20%">科目名称</th>
        <th width="10%">科目类型</th>
        <th width="5%">科目学分</th>
        <th width="5%">最大人数</th>
        <th width="5%">当前人数</th>
        <th width="10%">科目状态</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach var="st" items="${COUOSS.list}">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.cid}</td>
          <td>${st.tid}</td>
          <td>${st.cname}</td>
          <td>${st.ctype}</td>
          <td>${st.ccredit}</td>
          <td>${st.cmax}</td>
          <td>${st.cprecid}</td>
          <td>${st.cnote}</td>
		<td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath }/updatecourse.action?cid=${st.cid}"><span class="icon-edit"></span>修改</a>
		 			 <a class="button border-main" href="${pageContext.request.contextPath }/coustude.action?cid=${st.cid}" ><span class="icon-edit"></span> 管理</a>
		 <a class="button border-red" href="${pageContext.request.contextPath }/delectcourse.action?cid=${st.cid}" ><span class="icon-trash-o"></span> 删除</a>    
		     </tr>
        
        </c:forEach>
         <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/checkcourse.action?current=1">首页</a> 
      	
        <a href="${pageContext.request.contextPath }/checkcourse.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        <a href="${pageContext.request.contextPath }/checkcourse.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        <a href="${pageContext.request.contextPath }/checkcourse.action?current=${COUOSS.pages}">尾页</a>
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