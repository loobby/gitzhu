package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.zy.service.UserService;
import com.zy.vo.AuthInfo;
import com.zy.vo.PageUtil;
import com.zy.vo.Role;
import com.zy.vo.UserAuth;
import com.zy.vo.UserGroup;
import com.zy.vo.UserInfo;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class Userinfoto {
	
	@Autowired
	private UserService userservicei;
	
		
	@RequestMapping("/validCode.action")
	@ResponseBody									//判断验证码
	public JSONObject validCode(String vCode,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		HttpSession session = request.getSession();//获取随机验证码
		String sRand=(String)session.getAttribute("rand01");    
		Integer id;
		if(sRand.equals(vCode)) {
			id=1;
		}
		else {
			id=2;
		}
		JSONObject date =new JSONObject();
		date.put("msg",id);		//给json添加键值对数据
		return date;
	}
	
	
	@RequestMapping("/login.action")
	@ResponseBody									//判断登陆
	public JSONObject login(String vCode,String userPwd,String userCode,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			UserInfo userinfo =	new UserInfo();
			userinfo.setUserCode(userCode);
			userinfo.setUserPwd(userPwd);
			UserInfo user = userservicei.selectL(userinfo);
			Integer id = null;
			if(user!=null) {
				request.getSession().setAttribute("LOGIN",user);
				System.out.println(user.getUserState()+"********");
				if(user.getUserState().equals("0")) {
					id=2;
					System.out.println("222222");
				}else{
					System.out.println("111111");
					id=1;
				}
			}
		JSONObject date =new JSONObject();
		date.put("res",id);		//给json添加键值对数据
		return date;
	}
	
	
	
	
	@RequestMapping("/list.action")				//展示用户列表
	public void list(Integer pageNum,String userCode,String userType,String userState,HttpServletRequest request, HttpServletResponse response) throws IOException{					
			
			List<UserGroup> UserGroup = userservicei.findIdByuserGroup();//全查组表
			request.getSession().setAttribute("UserGroup",UserGroup);
			List<Role> roles = userservicei.findRoletype();//全查角色表
			request.getSession().setAttribute("ROLE",roles);
			
			
			pageNum =pageNum==null?1:pageNum;
			String userCode1 ="";
			String userType1 = null;
			String userState1 = null;
			
			if(userType!=null && userType!="") {
				Role role = userservicei.findIdByRoleName(userType);
				if(role.getRoleId()!=null) {
				userType1=role.getRoleId().toString();}
			}
			System.out.println(userState+"******");
			if(userState!=null && userState!="") {
				userState1=userState;
			}
			if(userCode!=null) {
				userCode1=userCode;
			}
			UserInfo user = new UserInfo();
			user.setUserCode(userCode1);
			user.setUserType(userType1);
			user.setUserState(userState1);
			request.getSession().setAttribute("USER",user);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("user", user);
			map.put("page", null);
			List<UserInfo> ulist = userservicei.findusRoUg(map);
			request.getSession().setAttribute("download",ulist);
			
			request.getSession().setAttribute("ULIST",ulist.size());
			Userinfoto.this.lists(pageNum,request, response);		
	}
	@RequestMapping("/lists.action")				//分页
	public void lists(Integer pageNum, HttpServletRequest request, HttpServletResponse response) throws IOException{
		pageNum =pageNum==null?1:pageNum;
		PageUtil PageUtil = new PageUtil(6,pageNum);
		HttpSession session = request.getSession();
		UserInfo user =(UserInfo) session.getAttribute("USER");
		Integer totalNum=(Integer) session.getAttribute("ULIST");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user", user);
		map.put("page", PageUtil);
		List<UserInfo> ulist = userservicei.findusRoUg(map);//全查用户表
		
		PageUtil pageUtil2 = new PageUtil(6,totalNum, pageNum,ulist,"user/lists.action",null);
		request.getSession().setAttribute("page",pageUtil2);
		PrintWriter out = response.getWriter();
		out.print("<script>location='../pages/user-list.jsp';</script>");	
	}
	
	
	
	
	
	@RequestMapping("/updateUser.action")				//修改用户
	public void updateUser(Integer userId,Integer groupId,String userCode,String nickName, HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		System.out.println(sRand.getPageNum());
		System.out.println(userId+"**"+groupId+"*"+userCode+"***"+nickName);
			UserInfo userin = new UserInfo();	
			userin.setUserId(userId);
			userin.setGroupId(groupId);
			userin.setUserCode(userCode);
			userin.setNickName(nickName);
			userservicei.insertUserINFo(userin);
			Userinfoto.this.list(sRand.getPageNum(), null, null, null, request, response);			
	}
	
	
	
	@RequestMapping("/deleteUser.action")					//删除用户
	public void deleteUser(Integer userid, HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("*********");
		System.out.println(userid);
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		userservicei.deleteUserINFo(userid);
		Userinfoto.this.list(sRand.getPageNum(), null, null, null, request, response);			
	}
	
	
	@RequestMapping("/stateUser.action")					//修改状态
	public void stateUser(String stateid,Integer userId,HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		
		String state=stateid.equals("1")?"0":"1";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("UserId", userId);
		map.put("UserState", state);
		userservicei.StateUserINFo(map);
		Userinfoto.this.list(sRand.getPageNum(), null, null, null, request, response);			
	}
	@RequestMapping("/adduser.action")
	@ResponseBody						//修改状态									//判断验证码
	public JSONObject adduser(String userCode,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		UserInfo idcode = userservicei.selectcode(userCode);
		
		Integer code= idcode!=null?1:0;
		
		JSONObject date =new JSONObject();
		date.put("msg",code);		//给json添加键值对数据
		return date;
	}
	@RequestMapping("/adduserinfo.action")			//修改状态									//判断验证码
	public void adduserinfo(UserInfo userinfo,HttpServletRequest request, HttpServletResponse response) throws IOException{		
		UserInfo inseruser=new UserInfo();
		inseruser.setUserCode(userinfo.getUserCode());
		inseruser.setGroupId(userinfo.getGroupId());
		inseruser.setUserPwd(userinfo.getUserPwd());
		inseruser.setNickName(userinfo.getNickName());
		//inseruser.setUserType("3");
		userservicei.insertUserinfo(inseruser);
		Userinfoto.this.list(1, null, null, null, request, response);			
	}
	
	@RequestMapping("/deleteuser.action")	//重置密码
	public void deleteuser(Integer userid,HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("****"+userid);
		HttpSession session = request.getSession();
		PageUtil sRand=(PageUtil) session.getAttribute("page");  
		userservicei.updateuserpwd(userid);
		Userinfoto.this.list(sRand.getPageNum(), null, null, null, request, response);			
	}
	@RequestMapping("/findrole.action")
	@ResponseBody//查询用户的角色
	public String findrole(Integer userids,HttpServletRequest request, HttpServletResponse response) throws IOException{
		String roleusid = userservicei.finduserRole(userids);
		request.getSession().setAttribute("roleID",userids);
				//给json添加键值对数据
		String date=roleusid;
		return date;
	}
	@RequestMapping("/updaterole.action")
	@ResponseBody//分配用户的角色
	@Transactional
	public String updaterole(String chid,HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		Integer sRand=(Integer) session.getAttribute("roleID");
		userservicei.deleteuserRole(sRand);
		
		String date="1";
		String[] strchid = chid.split(",");
		for (String  rchid : strchid) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userId", sRand);
			map.put("roleId", rchid);
			userservicei.inserteuserRole(map);
			date="2";
		}
		return date;
	}
	
	@RequestMapping("/changeuserauth.action")//查询权限 并把用户的权限✔
	public void changeuserauth(Integer userid,HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().setAttribute("authUid",userid);
		List<AuthInfo> authinfo = userservicei.findauthinfo();
		List<UserAuth> userauth = userservicei.finduserAnth(userid);
		
		List<Integer> userauthid = new ArrayList<Integer>();
		for(UserAuth auth :userauth) {
			userauthid.add(auth.getAuthId());
		}
		//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中  
		JSONArray auth = new JSONArray();
		for(AuthInfo aut:authinfo ) {
			JSONObject auths = new JSONObject();
			auths.put("id", aut.getAuthId());
			auths.put("pId", aut.getParentId());
			auths.put("name", aut.getAuthName());
			if(userauthid.contains(aut.getAuthId())) {
				auths.put("checked", true);
			}
			auth.add(auths);
		}
		request.getSession().setAttribute("AUTHS",auth);
		PrintWriter out = response.getWriter();
		out.print("<script>location='../pages/UserauthTree.jsp';</script>");	
	}
	@RequestMapping("/changeUserAuth.action")
	@ResponseBody//分配用户权限
	@Transactional
	public Integer changeUserAuth(String authId,HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		Integer authuid=(Integer) session.getAttribute("authUid");
		userservicei.deleteuserAuth(authuid);
		Integer cc = null;
		String authIds=authId;
		String[] auth = authIds.split(",");
		for (String  authid : auth) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userId", authuid);
			map.put("authid", authid);
			cc=userservicei.inserteuserAuth(map);
		}
		return cc;
	}
	@RequestMapping("/download.action")//导出当前数据
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		HttpSession session = request.getSession();
		PageUtil page = (PageUtil) session.getAttribute("page");
		request.getSession().setAttribute("download",page.getResultList());
		request.getRequestDispatcher("../pages/user-list-download.jsp").forward(request, response);
	}
	@RequestMapping("/downloads.action")//导出数据
	public void downloads(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		HttpSession session = request.getSession();
		List<UserInfo> UserIn = (List<UserInfo>) session.getAttribute("download");
		
		request.getSession().setAttribute("download",UserIn);
		request.getRequestDispatcher("../pages/user-list-download.jsp").forward(request, response);
	}
}
