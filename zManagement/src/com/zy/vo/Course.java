package com.zy.vo;


public class Course {
	private int cid;
	private int tid;
	private String cname;
	private String ctype;
	private float ccredit;
	private int cmax;
	private String cnote;
	private int cprecid;
	private Teacher teacher;
	private Elect elect;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public float getCcredit() {
		return ccredit;
	}
	public void setCcredit(float ccredit) {
		this.ccredit = ccredit;
	}
	public int getCmax() {
		return cmax;
	}
	public void setCmax(int cmax) {
		this.cmax = cmax;
	}
	public String getCnote() {
		return cnote;
	}
	public void setCnote(String cnote) {
		this.cnote = cnote;
	}
	public int getCprecid() {
		return cprecid;
	}
	public void setCprecid(int cprecid) {
		this.cprecid = cprecid;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Elect getElect() {
		return elect;
	}
	public void setElect(Elect elect) {
		this.elect = elect;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", tid=" + tid + ", cname=" + cname + ", ctype=" + ctype + ", ccredit=" + ccredit
				+ ", cmax=" + cmax + ", cnote=" + cnote + ", cprecid=" + cprecid + ", teacher=" + teacher + ", elect="
				+ elect + "]";
	}
	
	
}	
