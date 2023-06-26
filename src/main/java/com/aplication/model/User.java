package com.aplication.model;

public class User {
	private String uid;
	private String uname;
	private String upass;

	public User() {
		super();
	}

	public User(String uid, String uname, String upass) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upass = upass;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upass=" + upass + "]";
	}

}
