package com.zy.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.UserMapper;
import com.zy.service.UserService;
import com.zy.vo.AuthInfo;
import com.zy.vo.Role;
import com.zy.vo.UserAuth;
import com.zy.vo.UserGroup;
import com.zy.vo.UserInfo;
@Service
public class UserServiceimpl implements UserService {
	@Autowired
	private UserMapper usermapper;
	
	
	@Override
	public UserInfo selectL(UserInfo userinfo) {//判断登陆
		return usermapper.selectL(userinfo);
	}



	@Override
	public List<Role> findRoletype() {  //全查角色表
		
		return usermapper.findRoletype();
	}


	@Override
	public Role findIdByRoleName(String userType) {
	
		return usermapper.findIdByRoleName(userType);//查询角色id
	}



	@Override
	public List<UserInfo> findusRoUg(Map<String, Object> map) {
		//分页
		return usermapper.findusRoUg(map);
	}



	@Override
	public List<UserGroup> findIdByuserGroup() {
		//查询部门
		return usermapper.findIdByuserGroup();
	}



	@Override
	public void insertUserINFo(UserInfo userin) {
		usermapper.insertUserINFo(userin);
	}



	@Override
	public void deleteUserINFo(Integer userId) {//逻辑删除用户表
		usermapper.deleteUserINFo(userId);		
	}



	@Override
	public void StateUserINFo(Map<String, Object> map) {
		usermapper.StateUserINFo(map);
	}



	@Override
	public UserInfo selectcode(String usercode) {//查询用户存不存在
		return usermapper.selectcode(usercode);	
	}



	@Override
	public void insertUserinfo(UserInfo inseruser) {//添加用户
		usermapper.insertUserinfo(inseruser);
		
	}



	@Override
	public void updateuserpwd(Integer userId) {//重置用户密码
		usermapper.updateuserpwd(userId);
	}



	@Override
	public String finduserRole(Integer userId) {//查询当前用户的角色
		return usermapper.finduserRole(userId);
	}



	@Override
	public void deleteuserRole(Integer userId) {//删除当前用户的角色
		usermapper.deleteuserRole(userId);
		
	}
	@Override
	public void inserteuserRole(Map<String, Object> map) { //添加当前用户角色
		usermapper.inserteuserRole(map);
	}



	@Override
	public List<AuthInfo> findauthinfo() { //查询所有权限
		return usermapper.findauthinfo();
	}



	@Override
	public List<UserAuth> finduserAnth(Integer userId) {//查询用户权限
		// TODO Auto-generated method stub
		return usermapper.finduserAnth(userId);
	}



	@Override
	public Integer deleteuserAuth(Integer userId) {
		//删除当前用户的权限
		return usermapper.deleteuserAuth(userId);
	}
	@Override
	public Integer inserteuserAuth(Map<String, Object> map) {
		//添加当前用户权限
		return usermapper.inserteuserAuth(map);
	}



	


	

}
