package com.zy.service;

import java.util.List;
import java.util.Map;

import com.zy.vo.GroupRole;
import com.zy.vo.Role;
import com.zy.vo.UserGroup;

public interface UserGroupService {
	public List<UserGroup>findusergroup(Map<String, Object> map);//查询角色表
	public UserGroup findgroupname(String groupName);//组名唯一性
	public UserGroup findgroupCode(String groupCode);//组Code唯一性
	public Integer insertgroup(UserGroup usergroup);//添加组
	public Integer updategroup(UserGroup usergroup);//修改组
	public Integer deletegroup(Integer groupId);//删除组
	public String groupRole(Integer groupId);//查询组角色
	public List<Role> findRoletype();//全查角色表
	public Integer deletegroupRole(Integer groupId);//删除当前用户的角色
	public Integer insertegroupRole(Map<String, Object> map);//添加当前用户角色
}
