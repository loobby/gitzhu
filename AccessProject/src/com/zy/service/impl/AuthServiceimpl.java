package com.zy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zy.dao.AuthInfoMapper;
import com.zy.service.AuthService;
import com.zy.vo.AuthInfo;

public class AuthServiceimpl implements AuthService {
	@Autowired
	private AuthInfoMapper authinfomapper;

	@Override
	public List<AuthInfo> selectAuthinfo(Map<String, Object> map) {
		
		return authinfomapper.selectAuthinfo(map);
	}

	@Override
	public List<AuthInfo> authinfo() {//查询所有权限
	
		return authinfomapper.authinfo();
	}

	@Override
	public Integer updateAuth(AuthInfo auth) {//修改权限信息
		return authinfomapper.updateAuth(auth);
		
	}

	@Override
	public Integer upAuth(AuthInfo auth) {
		//<!--  修改权限状态-->
		return authinfomapper.upAuth(auth);
	}

	@Override
	public Integer insertAuthInfo(AuthInfo auth) {
		//添加用户
		return authinfomapper.insertAuthInfo(auth);
	}
	@Override
	public Integer upAuths(AuthInfo auth) {
		//<!--  修改权限状态-->
		return authinfomapper.upAuths(auth);
	}

	@Override
	public AuthInfo findname(AuthInfo auth) {
		//添加唯一性
		return authinfomapper.findname(auth);
	}
	
	
	


}
