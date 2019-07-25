package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.service.impl.Itemserviceimpl;
import com.zy.vo.Student;
import com.zy.vo.Teacher;

@Controller
public class lognController {
	@Autowired
	private Itemserviceimpl itemserviceimpl;
	//本页面是判断登陆 是哪位用户
	
	@RequestMapping("/login.action")//与页面提交路径相同
	public void queryIts(String id,String password, HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		if((id.substring(0,1)).equals("1")){
			Student stu =  itemserviceimpl.sidlogin(id);//先查有没有这个人  没有不能登陆
			if(stu!=null && stu.getSkey().equals(password)) {//判断密码是否输入正确

				session.setAttribute("STU",stu); //正确将查的用户值存再session中
				session.setAttribute("eqq",1);
				out.print("<script>alert('登陆成功!!');location='jsp/stuindex.jsp';</script>");
			}
			else {
				out.print("<script>alert('登陆失败!!请重新登陆');location='jsp/login.jsp';</script>");
			}
		}	
		else if((id.substring(0,1)).equals("9")){
			System.out.println("教师");
			Teacher tea =  itemserviceimpl.tidlogin(id);//先查有没有这个人  没有不能登陆
			if(tea!=null && tea.getTkey().equals(password)) {//判断密码是否输入正确
				session.setAttribute("STU",tea);//正确将查的用户值存再session中
				session.setAttribute("eqq",9);
				out.print("<script>alert('登陆成功!!');location='jsp/teaindex.jsp';</script>");
			}
			else {
				out.print("<script>alert('登陆失败!!请重新登陆');location='jsp/login.jsp';</script>");
			}
		}
		
		else if((id.substring(0,1)).equals("8")){
			System.out.println("教务处");
			Teacher tea =  itemserviceimpl.tidlogin(id);
			if(tea!=null && tea.getTkey().equals(password)) {//先查有没有这个人  没有不能登陆
				session.setAttribute("STU",tea);//判断密码是否输入正确
				session.setAttribute("eqq",8);//正确将查的用户值存再session中
				out.print("<script>alert('登陆成功!!');location='jsp/guanindex.jsp';</script>");
			}
			else {
				out.print("<script>alert('登陆失败!!请重新登陆');location='jsp/login.jsp';</script>");
			}
		}
		else {
			out.print("<script>alert('登陆失败!!请重新登陆');location='jsp/login.jsp';</script>");

		}
		
	}
}
