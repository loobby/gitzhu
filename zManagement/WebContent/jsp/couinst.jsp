<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="panel admin-panel margin-top" id="add">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/instercou.action?cid=${COURSEE.cid}&pid=1">   
      <div class="form-group">
        <div class="label">
          <label>老师id:</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tid" value="${COURSEE.tid}"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>科目名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${COURSEE.cname}" name="cname" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>科目类型：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${COURSEE.ctype}" name="ctype" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>科目学分：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${COURSEE.ccredit}" name="ccredit" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>最大人数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${COURSEE.cmax}" name="cmax" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程状态：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${COURSEE.cnote}" name="cnote" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
  
<input type="submit" class="button border-main icon-search" value="提交">    </form>
  </div>
</div>
</body></html>