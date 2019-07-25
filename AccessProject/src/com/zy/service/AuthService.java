package com.zy.service;

import java.util.List;
import java.util.Map;

import com.zy.vo.AuthInfo;
public interface AuthService {
	public List<AuthInfo> selectAuthinfo(Map<String, Object> map);
	public List<AuthInfo>authinfo();//查询所有权限
	public Integer updateAuth(AuthInfo auth);//修改权限信息
	public Integer upAuths(AuthInfo auth);//<!--  修改权限状态-->
	public Integer upAuth(AuthInfo auth);//<!--  修改权限状态-->
	
	public AuthInfo findname(AuthInfo auth);//判断用户名唯一
	
	public Integer insertAuthInfo(AuthInfo auth);//添加用户
}
