<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>个人信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 个人信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label>个人ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="stitle" value="${(sessionScope.STU).tid}" disabled="disabled" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>个人姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="surl" value="${(sessionScope.STU).tname}"  disabled="disabled"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>个人年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sentitle" value="${(sessionScope.STU).tage}"  disabled="disabled"/>
          <div class="tips"></div>
        </div>
      </div>
      
     
      <div class="form-group">
        <div class="label">
          <label>个人性别：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_name" value="${(sessionScope.STU).tsex}"  disabled="disabled"/>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>个人电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_tel" value="${(sessionScope.STU).tphone}" disabled="disabled"/>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>个人邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_fax" value="${(sessionScope.STU).tmail}" disabled="disabled"/>
          <div class="tips"></div>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>