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
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="5%" style="text-align:left; padding-left:20px;">课程ID</th>
        <th width="15%">课程名称</th>
        <th width="10%">课程类型</th>
        <th width="10%">学分</th>
        <th width="10%">已选人数</th>
        <th width="10%">总人数</th>
        <th width="20%">备注</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach var="st" items="${COUOSS.list}">
        <tr>
          <td style="text-align:left; padding-left:20px;">${st.cid}</td>
          <td>${st.cname}</td>
          <td>${st.ctype}</td>
          <td>${st.ccredit}</td>
          <td>${st.cprecid}</td>
          <td>${st.cmax}</td>
          <td>${st.cnote}</td>
          <c:if test="${st.cnote ne '已开课'}">
           <td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath }/queryit.action?cid=${st.cid}"><span class="icon-edit"></span>打分</a> 
          			<a class="button border-red" href="${pageContext.request.contextPath}/Changethetype.action?cid=${st.cid}" ><span class="icon-trash-o"></span>开课</a> </div></td>         			
          </div></td>
        	</c:if>
        	<c:if test="${st.cnote eq '已开课'}">
           <td><div class="button-group"> <a class="button border-main" href="${pageContext.request.contextPath }/queryit.action?cid=${st.cid}"><span class="icon-edit"></span>打分</a> 
          			<a class="button border-red" href="#" style="background:#E8E6E7" disabled="disabled"><span class="icon-trash-o"></span>开课</a> </div></td>         			
          </div></td>
        	</c:if>
         
        </tr>
        
        </c:forEach>
         <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/PrimaryCourse.action?current=1">首页</a> 
      	
      	
        <a href="${pageContext.request.contextPath }/PrimaryCourse.action?current=${COUOSS.pageNum==1?COUOSS.pages:COUOSS.pageNum-1}">上一页</a>
      
        
      
        <a href="${pageContext.request.contextPath }/PrimaryCourse.action?current=${COUOSS.pageNum==COUOSS.pages?1:COUOSS.pageNum+1}">下一页</a>
       
        
        <a href="${pageContext.request.contextPath }/PrimaryCourse.action?current=${COUOSS.pages}">尾页</a>
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