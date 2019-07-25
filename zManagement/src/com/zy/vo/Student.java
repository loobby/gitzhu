package com.zy.vo;

public class Student {
   private int sid;
   private String sname;
   private String skey;
   private String ssex;
   private int sage;
   private float scredit;
   private String saddress;
   private String sphone;
   private String semail;
   
   
		public int getSid() {
			return sid;
		}
		public void setSid(int sid) {
			this.sid = sid;
		}
		public String getSname() {
			return sname;
		}
		public void setSname(String sname) {
			this.sname = sname;
		}
		public String getSkey() {
			return skey;
		}
		public void setSkey(String skey) {
			this.skey = skey;
		}
		public String getSsex() {
			return ssex;
		}
		public void setSsex(String ssex) {
			this.ssex = ssex;
		}
		public int getSage() {
			return sage;
		}
		public void setSage(int sage) {
			this.sage = sage;
		}
		public float getScredit() {
			return scredit;
		}
		public void setScredit(float scredit) {
			this.scredit = scredit;
		}
		public String getSaddress() {
			return saddress;
		}
		public void setSaddress(String saddress) {
			this.saddress = saddress;
		}
		public String getSphone() {
			return sphone;
		}
		public void setSphone(String sphone) {
			this.sphone = sphone;
		}
		public String getSemail() {
			return semail;
		}
		public void setSemail(String semail) {
			this.semail = semail;
		}
		@Override
		public String toString() {
			return "Student [sid=" + sid + ", sname=" + sname + ", skey=" + skey + ", ssex=" + ssex + ", sage=" + sage
					+ ", scredit=" + scredit + ", saddress=" + saddress + ", sphone=" + sphone + ", semail=" + semail + "]";
		}
   


}
