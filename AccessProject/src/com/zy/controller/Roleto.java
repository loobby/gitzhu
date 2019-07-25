package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.zy.dao.RoleMapper;
import com.zy.vo.AuthInfo;
import com.zy.vo.PageUtil;
import com.zy.vo.Role;
import com.zy.vo.RoleAuth;
import com.zy.vo.UserAuth;
import com.zy.vo.UserInfo;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/Role")
public class Roleto {
	
	@Autowired
	private RoleMapper rolemapper;
	
	
	
	@RequestMapping("/findlist.action")							//查询角色
	public void findlist(Integer pageNum,String rolename,String roleState,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println("*********");
		pageNum =pageNum==null?1:pageNum;
		String rolename1="";
		String roleState1=null;
		if(rolename!=null) {
			rolename1=rolename;
		}
		if(roleState!=null && roleState!="") {
			roleState1=roleState;
		}
		Role role = new Role();
		role.setRoleName(rolename1);
		role.setRoleState(roleState1);
		request.getSession().setAttribute("ROLE",role);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("role", role);
		map.put("page", null);
		List<Role> totalNum = rolemapper.findrole(map);
		request.getSession().setAttribute("TOTALNUM",totalNum.size());
		Roleto.this.findlists(pageNum, request, response);
	}
	@RequestMapping("/findlists.action")							//修改权限
	public void findlists(Integer pageNum, HttpServletRequest request, HttpServletResponse response) throws IOException{		
		pageNum =pageNum==null?1:pageNum;
		PageUtil PageUtil = new PageUtil(4,pageNum);
		HttpSession session = request.getSession();
		Role Role =(Role) session.getAttribute("ROLE");
		Integer totalNum=(Integer) session.getAttribute("TOTALNUM");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("role", Role);
		map.put("page", PageUtil);
		List<Role> rolelist = rolemapper.findrole(map);//全查用户表
		
		PageUtil pageUtil2 = new PageUtil(4,totalNum, pageNum,rolelist,"Role/findlists.action",null);
		request.getSession().setAttribute("page",pageUtil2);
		PrintWriter out = response.getWriter();
		out.print("<script>location='../pages/role-list.jsp';</script>");	
	}
	
	
	@RequestMapping("/rolename.action")
	@ResponseBody									//判断name
	public JSONObject rolename(String name,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		Role role = rolemapper.findrolename(name);
		Integer id = null;
		if(role==null) {
			id=0;
		}
		else {
			id=1;
		}
		JSONObject date =new JSONObject();
		date.put("msg",id);		//给json添加键值对数据
		return date;
	}

	@RequestMapping("/rolecode.action")
	@ResponseBody									//判断code
	public JSONObject rolecode(String code,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		Role role = rolemapper.findrolecode(code);
		Integer id = null;
		if(role==null) {
			id=0;
		}
		else {
			id=1;
		}
		JSONObject date =new JSONObject();
		date.put("msg",id);		//给json添加键值对数据
		return date;
	}
	@RequestMapping("/addrole.action")  //判断添加角色
	public void addrole(String roleName,String desc,String code,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println(roleName+"**"+desc+"****"+code+"**");
		Role role = new Role();
		HttpSession session = request.getSession();
		UserInfo sRand=(UserInfo) session.getAttribute("LOGIN");  
		role.setRoleName(roleName);
		role.setRoleCode(code);
		role.setRoleDesc(desc);
		role.setCreateBy(sRand.getGroupId());
		Integer v = rolemapper.addrole(role);
		PageUtil sRands=(PageUtil) session.getAttribute("page");  
		
		if(v>0) {
			Roleto.this.findlist(sRands.getPageNum(), null, null, request, response);
		}
	}
	@RequestMapping("/updaterole.action")  //修改角色
	public void updaterole(String roleName,String desc,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println(roleName+"**"+desc+"****");
		Role uprole = new Role();
		uprole.setRoleName(roleName);
		uprole.setRoleDesc(desc);
		Integer v = rolemapper.uprole(uprole);
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		
		if(v>0) {
			Roleto.this.findlist(sRand.getPageNum(), null, null, request, response);
		}
	}
	@RequestMapping("/staterole.action")  //启用禁用
	public void staterole(Integer roleid,String stateid,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println(roleid+"**"+stateid+"****");
		Role uprole = new Role();
		uprole.setRoleId(roleid);
		uprole.setRoleState(stateid);
		Integer v = rolemapper.upstaterole(uprole);
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		
		if(v>0) {
			Roleto.this.findlist(sRand.getPageNum(), null, null, request, response);
		}
	}
	@RequestMapping("/deleterole.action")  //删除角色
	public void deleterole(Integer roleid,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println(roleid+"**");
		
		
		rolemapper.deleterole(roleid);
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
			Roleto.this.findlist(sRand.getPageNum(), null, null, request, response);
	}
	@RequestMapping("/upRoleAuth.action")  //更改权限
	public void upRoleAuth(Integer roleid,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		System.out.println(roleid+"**");
		request.getSession().setAttribute("roleid",roleid);
		List<AuthInfo> authinfo = rolemapper.findauthinfo();
		
		List<RoleAuth> roleauth = rolemapper.findroleAnth(roleid);
		
		
		List<Integer> roleauthid = new ArrayList<Integer>();
		
		for(RoleAuth auth :roleauth) {
			roleauthid.add(auth.getAuthId());
		}
		//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中  
		JSONArray auth = new JSONArray();
		for(AuthInfo aut:authinfo ) {
			JSONObject auths = new JSONObject();
			auths.put("id", aut.getAuthId());
			auths.put("pId", aut.getParentId());
			auths.put("name", aut.getAuthName());
			if(roleauthid.contains(aut.getAuthId())) {
				auths.put("checked", true);
			}
			auth.add(auths);
		}
		request.getSession().setAttribute("ROLEAUTHS",auth);
		PrintWriter out = response.getWriter();
		out.print("<script>location='../pages/RoleauthTree.jsp';</script>");	
	}
	@RequestMapping("/changeRoleAuth.action")
	@ResponseBody//分配角色权限
	@Transactional
	public Integer changeRoleAuth(String authId,HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		Integer roleid=(Integer) session.getAttribute("roleid");
		
		rolemapper.deleteroleAuth(roleid);
		Integer cc = null;
		String authIds=authId;
		String[] auth = authIds.split(",");
		for (String  authid : auth) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("roleId", roleid);
			map.put("authid", authid);
			cc=rolemapper.inserteroleAuth(map);
		}
		return cc;
	}	

}
