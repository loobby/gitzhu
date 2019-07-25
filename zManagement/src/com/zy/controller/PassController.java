package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.service.ItemService;
import com.zy.service.impl.Itemserviceimpl;
import com.zy.vo.Student;
import com.zy.vo.Teacher;
@Controller
public class PassController {	
		@Autowired
		private ItemService itemServicei;
		
		@RequestMapping("/paqss.action")//与页面提交路径相同
		public void queryIts(String mpass,String newpass, HttpServletRequest request, HttpServletResponse response) throws IOException{
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();	
			//获取session	
			Object eqq = session.getAttribute("eqq"); //判断是那个页面跳转过来的
			int eq=(int) eqq;
			if(eq==1) {//修改学生密码
				Object stuu=session.getAttribute("STU");
				Student stu= (Student) stuu;
				if(stu.getSkey().equals(mpass)) {
					int sid=stu.getSid();
					Student stud = new Student();
					stud.setSid(sid);
					stud.setSkey(newpass);
					itemServicei.upspass(stud);
					out.print("<script>alert('修改成功,使用正确密码登陆');parent.location.href='jsp/login.jsp';</script>");
				}
				else {
					out.print("<script>alert('521');location='jsp/pass.jsp';</script>");
				}
			}
			if(eq==9 || eq==8 ) {//修改老师密码
				Object teaa=session.getAttribute("STU");
				Teacher tea= (Teacher) teaa;
				if(tea.getTkey().equals(mpass)) {
					int tid=tea.getTid();
					Teacher tead = new Teacher();
					tead.setTid(tid);
					tead.setTkey(newpass);
					itemServicei.uptpass(tead);
					out.print("<script>alert('修改成功,使用正确密码登陆');parent.location.href='jsp/login.jsp';</script>");
				}
				else {
					out.print("<script>alert('521');location='jsp/pass.jsp';</script>");
				}
			}
			
		
			
	
	}
}
