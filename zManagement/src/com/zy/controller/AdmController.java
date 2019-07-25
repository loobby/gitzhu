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
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.service.ItemService;
import com.zy.vo.Course;
import com.zy.vo.Elect;
import com.zy.vo.Student;
import com.zy.vo.Teacher;

import javassist.runtime.Inner;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class AdmController {
	
	@Autowired
	private ItemService itemServicei;
			
	@RequestMapping("/Checkstudents.action")//查全部学生
	public void Checkstudents(Integer current, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		PageHelper.startPage(current,5);
		List<Student> cour=itemServicei.checkstudents();
		PageInfo<Student> couoss=new PageInfo<Student>(cour);
		request.getSession().setAttribute("COUOSS",couoss);				
		PrintWriter out = response.getWriter();
		out.print("<script>location='jsp/gstudentmanagement.jsp';</script>");
		}
	
	
	@RequestMapping("/Checkteachers.action")//查全部教师
		public void Checkteachers(Integer current, HttpServletRequest request, HttpServletResponse response) throws IOException {			
			PageHelper.startPage(current,5);
			List<Teacher> cour=itemServicei.checkteachers();
			PageInfo<Teacher> couoss=new PageInfo<Teacher>(cour);
			request.getSession().setAttribute("COUOSS",couoss);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/gteachermanagement.jsp';</script>");
			}
	@RequestMapping("/checkcourse.action")//查全部科目
	public void checkcourse(Integer current, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		PageHelper.startPage(current,5);
		List<Course> cour=itemServicei.checkcourse();
		PageInfo<Course> couoss=new PageInfo<Course>(cour);
		request.getSession().setAttribute("COUOSS",couoss);				
		PrintWriter out = response.getWriter();
		out.print("<script>location='jsp/gcoursemanaggement.jsp';</script>");
		}

@RequestMapping("/delectstudent.action")//删除某个学生
public void Delectstudent(Integer sid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
	itemServicei.Delectstudent(sid);	
	AdmController.this.Checkstudents(1, request, response);
	}
	@RequestMapping("/delectteacher.action")//删除某个教师
	public void Delectteacher(Integer tid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		List<Course> cous = itemServicei.selcouursetid(tid);
		if(cous.size()==0) {
			itemServicei.Delectteacher(tid);
			AdmController.this.Checkteachers(1, request, response);
		}else {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('删除失败,该老师还有授课');parent.location.href='jsp/guanindex.jsp';</script>");
		}
	
		}
	@RequestMapping("/delectcourse.action")//删除科目
	public void Delectcourse(Integer cid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
	
	itemServicei.Delectcourse(cid);
	AdmController.this.checkcourse(1, request, response);
		}




	@RequestMapping("/updatestudent.action")//修改某个学生
	public void updatestudent(Integer sid ,HttpServletRequest request, HttpServletResponse response) throws IOException {			
		
			Student student = itemServicei.upselectstu(sid);
			request.getSession().setAttribute("STUDENT",student);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/stuinst.jsp';</script>");
		}
	@RequestMapping("/updateteacher.action")//修改某个老师
			public void update(Integer tid ,HttpServletRequest request, HttpServletResponse response) throws IOException {			
				
				Teacher teacher = itemServicei.upselecttea(tid);
				request.getSession().setAttribute("TEACHER",teacher);				
				PrintWriter out = response.getWriter();
				out.print("<script>location='jsp/teainst.jsp';</script>");
		}
	@RequestMapping("/updatecourse.action")//修改某个课程
	public void course(Integer cid ,HttpServletRequest request, HttpServletResponse response) throws IOException {			
			
			Course course = itemServicei.upselectcou(cid);
			request.getSession().setAttribute("COURSEE",course);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/couinst.jsp';</script>");
		}






@RequestMapping("/instrstu.action")//开始修改学生
public void instr(Integer pid, Integer sid ,String sname, String skey, String ssex, Integer sage,Float scredit,String saddress,String sphone,String semail, HttpServletRequest request, HttpServletResponse response) throws IOException {			
			Student student =  new Student();
			student.setSaddress(saddress);
			student.setSage(sage);
			student.setScredit(scredit);
			student.setSemail(semail);
			student.setSid(sid);
			student.setSkey(skey);
			student.setSname(sname);
			student.setSphone(sphone);
			student.setSsex(ssex);
			if(pid==1) {
				itemServicei.instrstu(student);
				AdmController.this.Checkstudents(1, request, response);
						}
			if(pid==2) {
				List<Student> stu = itemServicei.selectstudent(sid);
				System.out.println(stu.size());
				if(stu.size()==0) {
					itemServicei.insetrstu(student);
					AdmController.this.Checkstudents(1, request, response);
									}
				else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('添加失败');location='jsp/stuadd.jsp';</script>");
					}
			}
			
			
}

		@RequestMapping("/instertea.action")//开始修改某个老师
		public void instertea(Integer pid,Integer tid, String tname, String tkey, String tsex,Integer tage,String tphone,String tmail,HttpServletRequest request, HttpServletResponse response) throws IOException {			
			Teacher teacher = new Teacher();
			teacher.setTage(tage);
			teacher.setTid(tid);
			teacher.setTkey(tkey);
			teacher.setTmail(tmail);
			teacher.setTname(tname);
			teacher.setTphone(tphone);
			teacher.setTsex(tsex);
			if(pid==1) {
				itemServicei.instrtea(teacher);
				AdmController.this.Checkteachers(1, request, response);
			}
			if(pid==2) {
				List<Teacher> tea = itemServicei.selectteacher(tid);
				if(tea.size()==0) {
					itemServicei.insettea(teacher);
					AdmController.this.Checkteachers(1, request, response);
						}
				else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('添加失败');location='jsp/teaadd.jsp';</script>");
					}
			}
			}
		@RequestMapping("/instercou.action")//开始修改某个课程
		public void instercou(Integer pid,Integer cid, Integer tid,String cname, String ctype, Float ccredit,Integer cmax,String cnote,HttpServletRequest request, HttpServletResponse response) throws IOException {			
			Course course = new Course();
			course.setCcredit(ccredit);
			course.setCid(cid);
			course.setCmax(cmax);
			course.setCname(cname);
			course.setCnote(cnote);
			course.setCtype(ctype);
			course.setTid(tid);
			if(pid==1) {
				itemServicei.insetcou(course);
				AdmController.this.checkcourse(1, request, response);
			}
			if(pid==2) {
		
				List<Course> cou = itemServicei.selectcourse(cid);
				if(cou.size()==0) {
					itemServicei.insetcou(course);
					AdmController.this.checkcourse(1, request, response);
						}
				else {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('添加失败');location='jsp/couadd.jsp';</script>");
					}
				}
		}


	
		@RequestMapping("/coustude.action")
		public void queryIt(Integer cid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
			Integer cids=cid;
			request.getSession().setAttribute("CCID",cids);				
			response.sendRedirect("coustudelete.action?current=1");
			}

		@RequestMapping("/coustudelete.action")
		public void coustudelete(Integer current,HttpServletRequest request, HttpServletResponse response) throws IOException {			
			HttpSession session = request.getSession();	
			Object cids = session.getAttribute("CCID");
			Integer cid=(Integer)cids;
			System.out.println(cid);
			PageHelper.startPage(1,5);
			List<Elect> cour=itemServicei.electst(cid); //查询科目下的学生
			PageInfo<Elect> couoss=new PageInfo<Elect>(cour);
			request.getSession().setAttribute("COUOSS",couoss);				
			PrintWriter out = response.getWriter();
			out.print("<script>location='jsp/coustudelete.jsp';</script>");
		}
		
		
		
		
		
		@RequestMapping("/deldtecourse.action")//踢出学生
		public void deldtecourse(Integer cid,Integer sid,HttpServletRequest request, HttpServletResponse response) throws IOException {			
			Elect elect = new Elect();
			elect.setCid(cid);
			elect.setSid(sid);
			itemServicei.Deleteelectives(elect);
			AdmController.this.coustudelete(1, request, response);					
		}
		
		
		
		
		
		
		
		
		
		@RequestMapping("/Chaojlkhk.action")//查全部学生
		@ResponseBody
		public String Chaojlkhk(String name,HttpServletRequest request, HttpServletResponse response) throws IOException{		
			//System.out.println(name);
			//boolean Chastudents = itemServicei.chaname(name);
			//return ""+Chastudents;
			PrintWriter out = response.getWriter();

			String s1 = "{name:'zhaoyu',age:20,sex:'nan'}";
			String s2 = "{name:'xiaoxiao',age:19,sex:'nv'}";
			String s3 = "{name:'xiaofei',age:18,sex:'nan'}";
				JSONObject zhaoyu = JSONObject.fromObject(s1);
				JSONObject xiaoxiao = JSONObject.fromObject(s2);
				JSONObject xiaofei = JSONObject.fromObject(s3);
			JSONArray arr = new JSONArray();
			arr.add(zhaoyu);
			arr.add(xiaoxiao);
			arr.add(xiaofei);
				out.print(arr);
				out.close();
				return ""+arr;
				
		}
	}