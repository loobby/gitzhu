package com.zy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.ItemsMapp;
import com.zy.service.ItemService;
import com.zy.vo.Course;
import com.zy.vo.Elect;
import com.zy.vo.Student;
import com.zy.vo.Teacher;

@Service
public class Itemserviceimpl implements ItemService {
	@Autowired
	private ItemsMapp itemsMapp;

	
	//判断登陆
	@Override
	public Teacher tidlogin(String name) {	//全查学生表
		return itemsMapp.tidlogin(name);
	}
	@Override
	public Student sidlogin(String name) {	//全查老师表
		return itemsMapp.sidlogin(name);
	}

	
	
	//修改密码
	@Override
	public void upspass(Student stud) {//修改学生密码
		itemsMapp.upspass(stud);
	}
	@Override
	public void uptpass(Teacher tead) {//修改老师密码
		itemsMapp.uptpass(tead);	
	}
	
	
	
	//查询类型
	@Override
	public List<Course> finCreditTeacher(String type) {//查选修和必修
		return itemsMapp.finCreditTeacher(type);
	}
	@Override
	public List<Course> DESCCredit(String type) {
		
		return itemsMapp.DESCCredit(type);
	}
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Elect> findcoursenotnull(Elect elect) {// 查该学生是否已经选择了这门课
		return itemsMapp.findcoursenotnull(elect);
	}
	@Override
	public void updcourse(Integer cid) {	//学生选择了课程 课程表已选人数加1
		itemsMapp.updcourse(cid);
	}
	@Override
	public void insetElect(Elect elect) {//将学生和课程添加到已经选择的表中
	
		itemsMapp.insetElect(elect);
	}
	
	
	
	
	
	@Override
	public List<Course> finddim(Course course) {//选修界面模糊查找
		return itemsMapp.finddim(course);
	}
	
	
	
	@Override
	public List<Course> electcourse(Integer cid) {//查学生已经选择的课程 是否开课
		return itemsMapp.electcourse(cid);
	}
	@Override
	public void Deleteelectives(Elect elect) {//删除选择的课程
				itemsMapp.Deleteelectives(elect);
	}
	@Override
	public void updatecprecid(Integer cid) {//课程表中已选人数减1 
		itemsMapp.updatecprecid(cid);
	}
	
	
	@Override
	public List<Course> PrimaryCourse(Integer tid) {//上面事查找老师教授的课
		
		return itemsMapp.PrimaryCourse(tid);
	}
	
	@Override
	public void Changethetype(Integer cid) {//老师控制开课
		itemsMapp.Changethetype(cid);
	}
	
	
	
	
	
	
	
	
	@Override
	public List<Elect> electst(Integer cid) {//查询科目下报名学生详情 
		
		return itemsMapp.electst(cid);
	}
	
	
	
	@Override
	public void upelect(Elect elect) {//打分情况 
		itemsMapp.upelect(elect);
		
	}
	@Override
	public void updatecourse(Integer sid) {//上面是添加学生成绩联动学分
		itemsMapp.updatecourse(sid);
	}
	
	
	
	
	
	
	
	
	//下面是管理员操作
	@Override
	public List<Student> checkstudents() {
		return itemsMapp.checkstudents();
	}
	@Override
	public List<Teacher> checkteachers() {
		return itemsMapp.checkteachers();
	}
	@Override
	public List<Course> checkcourse() {
		return itemsMapp.checkcourse();
	}
	
	
	@Override
	public void Delectstudent(Integer sid) {
		itemsMapp.Delectstudent(sid);
	}
	@Override
	public void Delectteacher(Integer tid) {
		itemsMapp.Delectteacher(tid);
	}
	@Override
	public void Delectcourse(Integer cid) {
		itemsMapp.Delectcourse(cid);
	}
	
	
	//修改账号
	@Override
	public Student upselectstu(Integer sid) {
		return itemsMapp.upselectstu(sid);
	}
	@Override
	public Teacher upselecttea(Integer tid) {
		return itemsMapp.upselecttea(tid);
	}
	@Override
	public Course upselectcou(Integer cid) {
		return itemsMapp.upselectcou(cid);
	}
	
	
	
	
	
	@Override
	public void instrstu(Student student) {
		itemsMapp.instrstu(student);
		
	}
	@Override
	public void instrtea(Teacher teacher) {
		itemsMapp.instrtea(teacher);
		
	}
	@Override
	public void instrcou(Course course) {
		itemsMapp.instrcou(course);
	}
	
	
	
	
	
	
	@Override
	public void insetrstu(Student student) {
		itemsMapp.insetrstu(student);
		
	}
	@Override
	public void insettea(Teacher teacher) {
		itemsMapp.insettea(teacher);
		
	}
	@Override
	public void insetcou(Course course) {
		itemsMapp.insetcou(course);		
	}
	
	
	
	
	
	@Override
	public void deldtecourse(Elect elect) {
		itemsMapp.deldtecourse(elect);
	}
	
	
	
	
	@Override
	public List<Student> selectstudent(Integer sid) {

		return itemsMapp.selectstudent(sid);
	}
	@Override
	public List<Teacher> selectteacher(Integer tid) {

		return itemsMapp.selectteacher(tid);
	}
	@Override
	public List<Course> selectcourse(Integer cid) {

		return itemsMapp.selectcourse(cid);
	}
	
	
	
	@Override
	public List<Course> selcouursetid(Integer tid) {

		return itemsMapp.selcouursetid(tid);
	}
	@Override
	public boolean chaname(String name) {
		return null==itemsMapp.chaname(name)?true:false;
	}
	
	
	
	
	
	



	
	




	




}
