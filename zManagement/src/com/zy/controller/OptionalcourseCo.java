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
public class OptionalcourseCo {
	@Autowired
	private ItemService itemServicei;
	
	
	@RequestMapping("/keywords.action")//选修模糊查询
	public void keyword(String keywords, HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		System.out.println(keywords+"**");
		String dim="%"+keywords+"%";
		request.getSession().setAttribute("DIM",dim);
		OptionalcourseCo.this.keywordcurr(1, request, response);
	}
	
	@RequestMapping("/keywordcurr.action")//选修模糊查询
	public void keywordcurr(Integer curr,HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		String ctype="选修";
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();	
		Object dims = session.getAttribute("DIM");
		String dim=(String)dims;
		
		Course course = new Course();
		course.setCname(dim);
		course.setCtype(ctype);
		PageHelper.startPage(curr,3);
		List<Course> cour=itemServicei.finddim(course);
		
		PageInfo<Course> courss=new PageInfo<Course>(cour);
		request.getSession().setAttribute("COUOSSOP",courss);
		out.print("<script>location='jsp/selective.jsp';</script>");
	}	
	
	
	
	
	
	@RequestMapping("/elective.action")//添加选修课程
	public void elective(Integer cid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();	
		Object stuu = session.getAttribute("STU");
		Student stu= (Student) stuu;
		Elect elect= new Elect();
		elect.setCid(cid);
		elect.setSid(stu.getSid());
		
		List<Elect> electnotnull=itemServicei.findcoursenotnull(elect);//判断学生已将选择了这门课程
		if(electnotnull.size()==0) {
			itemServicei.updcourse(cid);//课程表本门已选课程加1 
			itemServicei.insetElect(elect);//添加到已选课程表中
			OptionalcourseCo.this.keywordcurr(1, request, response);
		}else {
			out.print("<script>alert('已经选择了这门课');location='jsp/selective.jsp';</script>");

		}
		
	}
	
}
