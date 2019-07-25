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
@Controller
public class ElectCour {
	@Autowired
	private ItemService itemServicei;
			
	@RequestMapping("/electcou.action")//查询已经选择的课程
	public void queryIts(Integer current,HttpServletRequest request, HttpServletResponse response) throws IOException {			
		HttpSession session = request.getSession();	
		PrintWriter out = response.getWriter();
		Object stuu = session.getAttribute("STU");
		Student stu= (Student) stuu;
		Integer cid = stu.getSid();
		
		PageHelper.startPage(current, 3);
		List<Course> cour=itemServicei.electcourse(cid);//查询选择的课程
		PageInfo<Course> couoss=new PageInfo<Course>(cour);

		
		request.getSession().setAttribute("ELECT",couoss);		
		
		out.print("<script>location='jsp/selectedcourse.jsp';</script>");
		}


			@RequestMapping("/Deleteelectives.action")//与页面提交路径相同
			public void Deleteelective(Integer cid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
				HttpSession session = request.getSession();	
				Object stuu = session.getAttribute("STU");
				Student stu= (Student) stuu;
				Integer sid = stu.getSid();
				Elect elect = new Elect();
				elect.setSid(sid);
				elect.setCid(cid);
				
				itemServicei.Deleteelectives(elect);//删除已选课程
				itemServicei.updatecprecid(cid);//课程表已选人数加1 

				ElectCour.this.queryIts(1, request, response);
				
				}
			}