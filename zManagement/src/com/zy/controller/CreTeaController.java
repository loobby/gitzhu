package com.zy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.service.ItemService;
import com.zy.vo.Course;
import com.zy.vo.Elect;
import com.zy.vo.Student;
import com.zy.vo.Teacher;

@Controller
public class CreTeaController {
	
	@Autowired
	private ItemService itemServicei;
	
	@RequestMapping("/quepd.action")//学生查询必修
	public void quepd(Integer pd, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		Integer pds = pd;
		request.getSession().setAttribute("PDS",pds);				
		CreTeaController.this.queryIts(1, request, response);
		}
	
	
	@RequestMapping("/requiredcourse.action")//学生查询必修
	public void queryIts(Integer current, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		HttpSession session = request.getSession();	
		Object pds = session.getAttribute("PDS");
		Integer pd=(Integer) pds;
		String type="必修";
		if(pd==1) {
			
			PageHelper.startPage(current,5);
			List<Course> cour=itemServicei.finCreditTeacher(type);//全查选修的课程
			PageInfo<Course> couoss=new PageInfo<Course>(cour);
			request.getSession().setAttribute("COUOSS",couoss);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/slist.jsp';</script>");
		}
		if(pd==2) {
			PageHelper.startPage(current,5);
			List<Course> cour = itemServicei.DESCCredit(type);
			PageInfo<Course> couoss=new PageInfo<Course>(cour);
			request.getSession().setAttribute("COUOSS",couoss);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/slist.jsp';</script>");
		}
		
		}


	
@RequestMapping("/PrimaryCourse.action")//老师查询所带课程
public void PrimaryCourse(Integer current, HttpServletRequest request, HttpServletResponse response) throws IOException {			
	HttpSession session = request.getSession();	
	PrintWriter out = response.getWriter();
	Object tea = session.getAttribute("STU");
	Teacher teacher= (Teacher) tea;
	Integer tid=teacher.getTid();
	
	PageHelper.startPage(current,5);
	List<Course> cour=itemServicei.PrimaryCourse(tid);//老师查询自己所教授的课程
	PageInfo<Course> couoss=new PageInfo<Course>(cour);
	request.getSession().setAttribute("COUOSS",couoss);				
	
	out.print("<script>location='jsp/tlist.jsp';</script>");

	}

@RequestMapping("/Changethetype.action")//老师控制开课
public void Changethetype(Integer cid ,HttpServletRequest request, HttpServletResponse response) throws IOException {			
	itemServicei.Changethetype(cid);
	CreTeaController.this.PrimaryCourse(1, request, response);
	}
}



