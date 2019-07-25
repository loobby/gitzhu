package com.zy.dao;

import java.util.List;
import java.util.Map;

import com.zy.vo.AuthInfo;
import com.zy.vo.Role;
import com.zy.vo.RoleAuth;

public interface RoleMapper {
	public List<Role>findrole(Map<String, Object> map);//查询角色表

	public Role findrolename(String name); //查用户名是否重复 -->
	public Role findrolecode(String code); //查code是否重复 -->
	
	public Integer  addrole(Role role);//添加角色
	public Integer uprole(Role uprole);//修改角色
	public Integer upstaterole(Role uprole);//修改角色状态
	public void deleterole(Integer roleId);//删除角色
	
	
	public List<AuthInfo>findauthinfo();//查询所有权限
	public List<RoleAuth>findroleAnth(Integer roleId);//查询所有角色权限
	
	public Integer deleteroleAuth(Integer roleId);//删除当前用户的权限
	public Integer inserteroleAuth(Map<String, Object> map);//添加当前用户权限
}
