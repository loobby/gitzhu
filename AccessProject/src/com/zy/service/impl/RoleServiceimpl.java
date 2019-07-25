package com.zy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dao.RoleMapper;
import com.zy.service.RoleService;
import com.zy.vo.AuthInfo;
import com.zy.vo.Role;
import com.zy.vo.RoleAuth;

public class RoleServiceimpl implements RoleService {
	@Autowired
	private RoleMapper rolemapper;

	@Override
	public List<Role> findrole(Map<String, Object> map) {
		// 查询角色
		return rolemapper.findrole(map);
	}

	@Override
	public Role findrolename(String name) {
		//查用户名是否重复 -->
		return rolemapper.findrolename(name);
	}

	@Override
	public Role findrolecode(String code) {
		//查code是否重复 -->
		return rolemapper.findrolecode(code);
	}

	@Override
	public Integer addrole(Role role) {
		//添加角色
		return rolemapper.addrole(role);
	}

	@Override
	public Integer uprole(Role uprole) {
		//修改角色
		return rolemapper.uprole(uprole);
	}

	@Override
	public Integer upstaterole(Role uprole) {
		//修改角色状态
		return rolemapper.upstaterole(uprole);
	}

	@Override
	public void deleterole(Integer roleId) {
		//删除角色
		rolemapper.deleterole(roleId);
	}

	@Override
	public List<AuthInfo> findauthinfo() {
		//查询所有权限
		return rolemapper.findauthinfo();
	}

	@Override
	public List<RoleAuth> findroleAnth(Integer roleId) {
		//查询所有角色权限
		return rolemapper.findroleAnth(roleId);
	}

	@Override
	public Integer deleteroleAuth(Integer roleId) {
		//删除当前用户的权限
		return rolemapper.deleteroleAuth(roleId);
	}

	@Override
	public Integer inserteroleAuth(Map<String, Object> map) {
		//添加当前用户权限
		return rolemapper.inserteroleAuth(map);
	}


	

	


}
