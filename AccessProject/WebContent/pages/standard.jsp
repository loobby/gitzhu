﻿<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 
总 ${page.totalNum} 条&nbsp; 
每页 ${page.pageSize} 条&nbsp; 
总 ${page.pageCount} 页 &nbsp; 
第 ${page.pageNum} 页&nbsp; 
<c:if test="${page.pageNum==1}">首页</c:if>
<c:if test="${page.pageNum!=1}"><a href="${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum=1">首页</a></c:if>
&nbsp;
<c:if test="${page.pageNum==1}">上一页</c:if>
<c:if test="${page.pageNum!=1}"><a href="${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum=${page.pageNum-1}">上一页</a></c:if>
&nbsp;
<c:if test="${page.pageNum==page.pageCount}">下一页</c:if>
<c:if test="${page.pageNum!=page.pageCount}"><a href="${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum=${page.pageNum+1}">下一页</a></c:if>
&nbsp;
<c:if test="${page.pageNum==page.pageCount}">尾页</c:if>
<c:if test="${page.pageNum!=page.pageCount}"><a href="${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum=${page.pageCount}">尾页</a></c:if>
&nbsp;

 第<select onchange="location.href='${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum='+this.value">
	<c:forEach var="selectvalue" begin="1" end="${page.pageCount}" step="1">
		<option value="${selectvalue}" ${page.pageNum eq selectvalue ?"selected='selected'":""}>
			${selectvalue}   
		</option>
	</c:forEach>
</select>
页 

每页
<select onchange="location.href='${pageContext.request.contextPath}/${page.url}?${page.params}&pageNum='+this.value">
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
</select>
条



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	