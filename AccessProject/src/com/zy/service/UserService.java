package com.zy.service;

import java.util.List;
import java.util.Map;

import com.zy.vo.AuthInfo;
import com.zy.vo.Role;
import com.zy.vo.UserAuth;
import com.zy.vo.UserGroup;
import com.zy.vo.UserInfo;

public interface UserService {
	public UserInfo selectL(UserInfo userinfo); //判断登陆
	public List<UserInfo>findusRoUg(Map<String, Object> map);  //全查用户信息
	public List<Role> findRoletype();//全查角色表
	public  Role  findIdByRoleName(String userType);//查询角色类型id
	public List<UserGroup> findIdByuserGroup();//查询部门
	public void insertUserINFo(UserInfo userin);//修改USerinfo表
	public void deleteUserINFo(Integer userId);//逻辑删除用户表
	public void StateUserINFo(Map<String, Object> map);//修改用户状态
	public UserInfo selectcode(String usercode);//查询用户存不存在
	public void insertUserinfo(UserInfo inseruser);//添加用户
	public void updateuserpwd(Integer userId);//重置用户密码
	public String finduserRole(Integer userId);//查询当前用户的角色
	public void deleteuserRole(Integer userId);//删除当前用户的角色
	public void inserteuserRole(Map<String, Object> map);//添加当前用户角色
	public List<AuthInfo>findauthinfo();//查询所有权限
	public List<UserAuth>finduserAnth(Integer userId);//查询用户权限
	public Integer deleteuserAuth(Integer userId);//删除当前用户的权限
	public Integer inserteuserAuth(Map<String, Object> map);//添加当前用户权限
	}
