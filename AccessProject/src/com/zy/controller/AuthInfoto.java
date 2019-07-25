
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
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.ResponseBody;

	import com.alibaba.fastjson.JSONArray;
	import com.zy.dao.AuthInfoMapper;
	import com.zy.vo.AuthInfo;

	import com.zy.vo.UserInfo;

	import net.sf.json.JSONObject;

	@Controller
	@RequestMapping("/Auth")
	public class AuthInfoto {
		@Autowired
		private AuthInfoMapper authinfomapper;
		
		@RequestMapping("/index.action")							//判断登陆
		public void index(HttpServletRequest request, HttpServletResponse response) throws IOException{		
			HttpSession session = request.getSession();//登陆用户id
			UserInfo user =(UserInfo) session.getAttribute("LOGIN");  	
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("userId", user.getUserId());
			map.put("authId", 0);	
			
			//所有的一级权限
			List<AuthInfo> findAuth =  authinfomapper.selectAuthinfo(map);
					 for(AuthInfo ai:findAuth) {
						 System.out.println(ai.getAuthId());
						 map.put("authId",ai.getAuthId());
						 ai.setChildList(authinfomapper.selectAuthinfo(map));
					 }
			request.getSession().setAttribute("firstList",findAuth);
			PrintWriter out = response.getWriter();
			out.print("<script>location='../pages/index.jsp';</script>");
		}
		
		
		
		
		
		
		
		
		@RequestMapping("/findAuthIn.action")//查询权限 
		public void findAuthIn(HttpServletRequest request, HttpServletResponse response) throws IOException{
			List<AuthInfo> authinfo = authinfomapper.authinfo();

			//id 标识 ，pId 父id，name 名称，open 是否展开节点， checked  是否选中  
			JSONArray auth = new JSONArray();
			for(AuthInfo aut:authinfo ) {
				JSONObject auths = new JSONObject();
				auths.put("id", aut.getAuthId());
				auths.put("pId", aut.getParentId());
				auths.put("name", aut.getAuthName());
				auths.put("state", aut.getAuthState());
				auths.put("authGrade", aut.getAuthGrade());
				auth.add(auths);
			}
			request.getSession().setAttribute("AUTHS",auth);
			PrintWriter out = response.getWriter();
			out.print("<script>location='../pages/authTree.jsp';</script>");	
		}
		
		@RequestMapping("/updateAuth.action")
		@ResponseBody								//修改权限信息
		public void updateAuth(Integer authId, String an,String ad,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(authId+"**"+an+"**"+ad);
			AuthInfo auth = new AuthInfo();
			auth.setAuthDesc(ad);
			auth.setAuthId(authId);
			auth.setAuthName(an);
			Integer pdauth = authinfomapper.updateAuth(auth);
			AuthInfoto.this.findAuthIn(request, response);	

		}
		@RequestMapping("/reinAuth.action")
		@ResponseBody								//修改权限状态
		public void reinAuth(Integer authIds,String State,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(authIds);
			AuthInfo auth = new AuthInfo();
			auth.setAuthState(State);
			auth.setAuthId(authIds);
			authinfomapper.upAuth(auth);
			authinfomapper.upAuths(auth);
		}
		@RequestMapping("/addAuthname.action")
		@ResponseBody								//判断名称唯一性
		public JSONObject addAuthname(String name, String url,String code,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(name);
			AuthInfo auth = new AuthInfo();
			auth.setAuthName(name);
			auth.setAuthCode(code);
			auth.setAuthUrl(url);
			AuthInfo  auths = authinfomapper.findname(auth);
			
			Integer id=auths==null?0:1;
			JSONObject date =new JSONObject();
			date.put("msg",id);	
			return date;
		}
		
		//添加权限
		@RequestMapping("/addAuth.action")						
		public void addAuth(String code,String anme,String url,String desc,Integer Grade,Integer authidd,String type,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			System.out.println(anme+"**"+url+"**"+desc+"**"+Grade+"**"+authidd);
			AuthInfo auth = new AuthInfo();
			auth.setAuthName(anme);
			auth.setAuthUrl(url);
			auth.setAuthDesc(desc);
			auth.setAuthGrade(Grade);
			auth.setParentId(authidd);  
			auth.setAuthType(type);
			auth.setAuthCode(code);
			Integer au = authinfomapper.insertAuthInfo(auth);
			if(au!=0) {
				AuthInfoto.this.findAuthIn(request, response);	
					}
		}
		
		
		}

