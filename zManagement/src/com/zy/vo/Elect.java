package com.zy.vo;

public class Elect {
	private int sid;
	private int cid;
	private float score;
	
	private Student student;
	private Course course;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	@Override
	public String toString() {
		return "Elect [sid=" + sid + ", cid=" + cid + ", score=" + score + ", student=" + student + ", course=" + course
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
