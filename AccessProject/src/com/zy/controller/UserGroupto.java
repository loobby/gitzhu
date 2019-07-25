package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.dao.UserGroupMapper;
import com.zy.vo.PageUtil;
import com.zy.vo.Role;
import com.zy.vo.UserGroup;
import com.zy.vo.UserInfo;

import net.sf.json.JSONObject;
@Controller
@RequestMapping("/group")
public class UserGroupto {
	@Autowired
	private UserGroupMapper usergroupmapper;
	
	
		@RequestMapping("/findgroup.action")//查看用户组
		public void rolelist(Integer pageNum,String groupname,String groupstate,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println("*********");
				pageNum =pageNum==null?1:pageNum;
				String groupname1="";
				String groupstate1=null;
				if(groupname!=null) {
					groupname1=groupname;
				}
				if(groupstate!=null && groupstate!="") {
					groupstate1=groupstate;
				}

				UserGroup usergroup = new UserGroup();
				usergroup.setGroupName(groupname1);
				usergroup.setGroupState(groupstate1);
				
				request.getSession().setAttribute("USERGROUP",usergroup);
				
				
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("ugroup", usergroup);
				map.put("page", null);
				List<UserGroup> totalNum = usergroupmapper.findusergroup(map);
				request.getSession().setAttribute("TOTALNUM",totalNum.size());
				List<Role> roles = usergroupmapper.findRoletype();//全查角色表
				request.getSession().setAttribute("ROLE",roles);
				UserGroupto.this.findlists(pageNum, request, response);
			}
			@RequestMapping("/findgrouplists.action")							//修改权限
			public void findlists(Integer pageNum, HttpServletRequest request, HttpServletResponse response) throws IOException{		
				
				pageNum =pageNum==null?1:pageNum;
				PageUtil PageUtil = new PageUtil(4,pageNum);
				HttpSession session = request.getSession();
				UserGroup usergroup =(UserGroup) session.getAttribute("USERGROUP");
				Integer totalNum=(Integer) session.getAttribute("TOTALNUM");
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("ugroup", usergroup);
				map.put("page", PageUtil);
				
				List<UserGroup> usergrouplist = usergroupmapper.findusergroup(map);//全查角色表
				
				for(UserGroup  us:usergrouplist) {
					System.out.println(us.getGroupName());
				}
				
				
				PageUtil pageUtil2 = new PageUtil(4,totalNum, pageNum,usergrouplist,"group/findgrouplists.action",null);
				request.getSession().setAttribute("page",pageUtil2);
				PrintWriter out = response.getWriter();
				out.print("<script>location='../pages/UserGroup-list.jsp';</script>");	
			}
			
			

			@RequestMapping("/Groupname.action")
			@ResponseBody									//判断name
			public JSONObject Groupname(String name,HttpServletRequest request, HttpServletResponse response) throws IOException{		
				
				UserGroup Group = usergroupmapper.findgroupname(name);
				
				Integer id = null;
				id=Group==null?0:1;
				JSONObject date =new JSONObject();
				date.put("msg",id);		//给json添加键值对数据
				return date;
			}

	@RequestMapping("/Groupcode.action")
			@ResponseBody									//判断code
			public JSONObject Groupcode(String code,HttpServletRequest request, HttpServletResponse response) throws IOException{		
				UserGroup Group = usergroupmapper.findgroupCode(code);
				
				Integer id = null;
				id=Group==null?0:1;
				JSONObject date =new JSONObject();
				date.put("msg",id);		//给json添加键值对数据
				return date;
			}
		@RequestMapping("/addGroup.action")  //添加组
			public void addGroup(String Name,String desc,String code,HttpServletRequest request, HttpServletResponse response) throws IOException{		
				System.out.println(Name+"**"+desc+"****"+code+"**");
				
				UserGroup usergroup = new UserGroup();
				usergroup.setGroupCode(code);
				usergroup.setGroupDesc(desc);
				usergroup.setGroupName(Name);
				
				Integer v=usergroupmapper.insertgroup(usergroup);
				
				
				HttpSession session = request.getSession();
				PageUtil sRands=(PageUtil) session.getAttribute("page");  
				if(v>0) {
					UserGroupto.this.rolelist(sRands.getPageNum(), null, null, request, response);
				}
			}
		@RequestMapping("/updategroup.action")  //修改组
		public void updategroup(Integer id,String desc,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(id+"**"+desc+"****");
			UserGroup usergroup = new UserGroup();
			usergroup.setGroupDesc(desc);
			usergroup.setGroupId(id);
			
			Integer v=usergroupmapper.updategroup(usergroup);
			HttpSession session = request.getSession();
			PageUtil sRands=(PageUtil) session.getAttribute("page");  
			if(v>0) {
				UserGroupto.this.rolelist(sRands.getPageNum(), null, null, request, response);
			}
		}
		@RequestMapping("/deletegroup.action")  //删除组
		public void deletegroup(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(id+"**");
			Integer v=usergroupmapper.deletegroup(id);
			HttpSession session = request.getSession();
			PageUtil sRands=(PageUtil) session.getAttribute("page");  
			if(v>0) {
				UserGroupto.this.rolelist(sRands.getPageNum(), null, null, request, response);
			}
		}
		@RequestMapping("/stategroup.action")  //启用禁用
		public void stategroup(Integer id,String stateid,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(id+"**"+stateid+"****");
			UserGroup usergroup = new UserGroup();
			usergroup.setGroupState(stateid);
			usergroup.setGroupId(id);
			Integer v = usergroupmapper.updategroup(usergroup);
			
			HttpSession session = request.getSession();
			PageUtil sRands=(PageUtil) session.getAttribute("page");  
			if(v>0) {
				UserGroupto.this.rolelist(sRands.getPageNum(), null, null, request, response);
			}
		}
		@RequestMapping("/findgrouprole.action")
		@ResponseBody//查询用户的角色
		public String findgrouprole(Integer groupid,HttpServletRequest request, HttpServletResponse response) throws IOException{
			String roleid = usergroupmapper.groupRole(groupid);
			request.getSession().setAttribute("GROUPID",groupid);
					//给json添加键值对数据
			String date=roleid;
			return date;
		}
		@RequestMapping("/updategrouprole.action")
		@ResponseBody//分配用户的角色
		@Transactional
		public String updategrouprole(String chid,HttpServletRequest request, HttpServletResponse response) throws IOException{
			HttpSession session = request.getSession();
			Integer sRand=(Integer) session.getAttribute("GROUPID");
			usergroupmapper.deletegroupRole(sRand);
			
			String date="1";
			String[] strchid = chid.split(",");
			for (String  rchid : strchid) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("groupId", sRand);
				map.put("roleId", rchid);
				usergroupmapper.insertegroupRole(map);
				date="2";
			}
			return date;
		}
	}
