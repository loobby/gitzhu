package com.zy.service;

import java.util.List;

import com.zy.vo.Course;
import com.zy.vo.Elect;
import com.zy.vo.Student;
import com.zy.vo.Teacher;

public interface ItemService {
	//全查Service接口
	public Student sidlogin(String name);//全查学生
	public Teacher tidlogin(String name);//全查老师
	
	public boolean chaname(String name);
	
	
	
	
	

	public void upspass(Student stud);//修改学生密码
	public void uptpass(Teacher tead);//修改老师密码
	
	public List<Course>finCreditTeacher(String type);//查选修和必修
	public List<Course>DESCCredit(String type);//倒叙查必修
	
	
	public List<Elect>findcoursenotnull(Elect elect);// 查该学生是否已经选择了这门课 --
	public void updcourse(Integer cid);	//学生选择了课程 课程表已选人数加1  -->
	public void insetElect(Elect elect);//将学生和课程添加到已经选择的表中
	
	public List<Course>finddim(Course course);//选修界面模糊查找
	
	public List<Course>electcourse(Integer cid);//查学生已经选择的课程 是否开课
	public void Deleteelectives (Elect elect);	//删除选择的课程
	public void updatecprecid(Integer cid);//课程表中已选人数减1 
	
	
	public List<Course> PrimaryCourse(Integer tid);//上面事查找老师教授的课
	public void Changethetype(Integer cid);//老师控制开课
	
	
	public List<Elect>electst(Integer cid);//查询科目下报名学生详情 
	
	
	public void upelect(Elect elect);//打分情况 
	public void updatecourse(Integer sid);//上面是添加学生成绩联动学分
	
	
	
	//下面是管理员页面操作
		public List<Student> checkstudents();
		public List<Teacher> checkteachers();
		public List<Course> checkcourse();

		
		public void Delectstudent(Integer sid);
		public void Delectteacher(Integer tid);
		public void Delectcourse(Integer cid);

		
		
		//修改账号
		public Student upselectstu(Integer sid);
		public Teacher upselecttea(Integer tid);
		public Course upselectcou(Integer cid);
		
		
		public void instrstu(Student student);
		public void instrtea(Teacher teacher);
		public void instrcou(Course course);
		
		//添加账号
		public void insetrstu(Student student);
		public void insettea(Teacher teacher);
		public void insetcou(Course course);
		
		//删除选课的用户
		public void deldtecourse(Elect elect);

		
		
		
		
		//判断添加是否id已经有了
		public List<Student>selectstudent(Integer sid);
		public List<Teacher>selectteacher(Integer tid);
		public List<Course>selectcourse(Integer cid);
		
		
		
		public List<Course>selcouursetid(Integer tid);
		
}
