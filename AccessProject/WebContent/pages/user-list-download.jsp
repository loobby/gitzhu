<%@ page language="java" pageEncoding="gbk"%>
<%@ page contentType="application/msword" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- 
Wordֻ��Ҫ��contentType="application/msexcel"��ΪcontentType="application/msword" 
--%>
<%   
  //������excel���   
  //response.setHeader("Content-disposition","attachment; filename=MyExcel.xls");   
  
//Ƕ����ie���excel   
  
response.setHeader("Content-disposition","inline; filename=MyExcel.xls");   
  
//response.setHeader("Content-disposition","inline; filename=MyExcel.doc");   
%>  
<html>  
<head>  
<title>���Ե���Excel��Word</title>  
</head>  
<body>  

  <table class="table table-hover table-bordered role-list" width="500" border="1" align="center">
            	<tr>
                    <td >�û�ID</td>
                    <td >�û���</td>
                    <td >�û��ǳ�</td>
                    <td >�û�����</td>
                    <td >�û�״̬</td>
                    <td >������</td>
                    <td >����ʱ��</td>
                </tr>
                <!-- �����б����� -->
                <c:forEach items="${download}" var="role">
	                <tr>
	                    <td >${role.userId }</td>
	                    <td >${role.userCode}</td>
	                   
	                    <td >${role.usergroup.groupName}</td>
	                   <td>${role.role.roleName}</td>
						<td class="usernames"
							style="${role.userState eq 0?'color:red;':'' }">${role.userState eq 0?"����":"����" }
						</td>
						  <td >${role.nickName}</td>
							<!-- ʱ���ʽ��ת�� -->
						<td><fmt:formatDate value="${role.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
	                 </tr>
                </c:forEach> 

     </table> 
</body>  
</html>  
 
