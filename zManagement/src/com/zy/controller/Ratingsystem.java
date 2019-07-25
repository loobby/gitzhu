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

@Controller
public class Ratingsystem {
	@Autowired
	private ItemService itemServicei;
	@RequestMapping("/queryit.action")
	public void queryIt(Integer cid, HttpServletRequest request, HttpServletResponse response) throws IOException {			
		Integer cids=cid;//获取科目id
		request.getSession().setAttribute("CID",cids);				
		response.sendRedirect("queryIts.action?current=1");
		}

	
	
	
	@RequestMapping("/queryIts.action")//查询科目下报名学生详情 
	public void queryIts(Integer current,HttpServletRequest request, HttpServletResponse response) throws IOException {			
		HttpSession session = request.getSession();	
		Object cids = session.getAttribute("CID");
		
		
		Integer cid=(Integer)cids;
		PageHelper.startPage(1,5);
		List<Elect> cour=itemServicei.electst(cid);
		PageInfo<Elect> couoss=new PageInfo<Elect>(cour);
		request.getSession().setAttribute("COUOSS",couoss);				
		PrintWriter out = response.getWriter();
		out.print("<script>location='jsp/tips.jsp';</script>");
	}
	
	
	
	
	@RequestMapping("/grade.action")//添加分数联动
	public void grade(Integer sid,String score, HttpServletRequest request, HttpServletResponse response) throws IOException {					
		
		HttpSession session = request.getSession();	
		Object cids = session.getAttribute("CID");
		Integer cid=(Integer)cids;
		Float scoree= Float.parseFloat(score);
		
		Elect elect = new Elect();
		elect.setCid(cid);
		elect.setScore(scoree);
		elect.setSid(sid);
		itemServicei.upelect(elect);//添加打分 
		itemServicei.updatecourse(sid);//分数联动
		Ratingsystem.this.queryIt(cid, request, response);
	}
}


