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
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/instertea.action?tid=${TEACHER.tid}&pid=1">   
      <div class="form-group">
        <div class="label">
          <label>老师姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tname" value="${TEACHER.tname}"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>老师密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${TEACHER.tkey}" name="tkey" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>老师性别：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${TEACHER.tsex}" name="tsex" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>老师年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${TEACHER.tage}" name="tage" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>老师电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${TEACHER.tphone}" name="tphone" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>老师邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${TEACHER.tmail}" name="tmail" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
<input type="submit" class="button border-main icon-search" value="提交">    </form>
    </form>
  </div>
</div>
</body></html>