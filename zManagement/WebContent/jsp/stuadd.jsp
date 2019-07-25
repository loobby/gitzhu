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
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/instrstu.action?pid=2">    
      <div class="form-group">
        <div class="label">
          <label>学生ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="sid" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sname" value=""  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="skey" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生性别：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="ssex" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="sage" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>学生学分：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="scredit" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="saddress" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="sphone" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="semail" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
<input type="submit" class="button border-main icon-search" value="提交">    </form>
    </form>
  </div>
</div>
</body></html>