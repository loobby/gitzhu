package com.zy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dao.UserGroupMapper;
import com.zy.service.UserGroupService;
import com.zy.vo.GroupRole;
import com.zy.vo.Role;
import com.zy.vo.UserGroup;

public class UserGroupServiceimpl implements UserGroupService {
	@Autowired
	private UserGroupMapper usergroupmapper;

	@Override
	public List<UserGroup> findusergroup(Map<String, Object> map) {
		//查询角色表
		return usergroupmapper.findusergroup(map);
	}

	@Override
	public UserGroup findgroupname(String groupName) {
		//组名唯一性
		return usergroupmapper.findgroupname(groupName);
	}

	@Override
	public UserGroup findgroupCode(String groupCode) {
		//组Code唯一性
		return usergroupmapper.findgroupCode(groupCode);
	}

	@Override
	public Integer insertgroup(UserGroup usergroup) {
		//添加组
		return usergroupmapper.insertgroup(usergroup);
	}

	@Override
	public Integer updategroup(UserGroup usergroup) {
		//修改组
		return usergroupmapper.updategroup(usergroup);
	}

	@Override
	public Integer deletegroup(Integer groupId) {
		//删除组
		return usergroupmapper.deletegroup(groupId);
	}

	@Override
	public String groupRole(Integer groupId) {
		//查询组角色
		return usergroupmapper.groupRole(groupId);
	}

	@Override
	public List<Role> findRoletype() {
		//全查角色表
		return usergroupmapper.findRoletype();
	}

	@Override
	public Integer deletegroupRole(Integer groupId) {
		//删除当前用户的角色
		return usergroupmapper.deletegroupRole(groupId);
	}

	@Override
	public Integer insertegroupRole(Map<String, Object> map) {
		//添加当前用户角色
		return usergroupmapper.insertegroupRole(map);
	}

	
}
