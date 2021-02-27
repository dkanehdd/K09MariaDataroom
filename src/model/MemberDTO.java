package model;

import java.sql.Date;
/*
DTO객체(Data Transfer Object)
	:데이터를 저장하기 위한 객체로 멤버변수, 생성자, getter/setter
	메소드를 가지고있는 클래스로 일반적인 자바빈(Bean)규약을 따른다.
 */
public class MemberDTO {
	
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;
	private String address;
	private String email;
	private String phone;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	//기본생성자
/*
 액션태그의 useBean을 통해 폼값을 한꺼번에 받기위해서는
 <form태그 하위 <input>의 name속성과 DTO객체의 멤버변수명이 반드시 일치해야한다. 
 */	
//	private int age1;
//	public int getAge1() {
//		return age1;
//	}
//	public void setAge1(int age1) {
//		this.age1 = age1;
//	}
	public MemberDTO() {
		
	}
	//인자생성자
	public MemberDTO(String id, String pass, String name, Date regidate) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
	}
	
	//getter/setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	/*
	Object클래스에 정의된 메소드로 객체를 문자열 형태로 변환해서 반환해주는역할을한다.
	toString()을 오버라이딩 하면 객체 자체를 그대로 println() 하는것이 가능하다. 
	*/
	@Override
	public String toString() {
		return String.format("아이디 :%s, 비밀번호:%s, 이름:%s", id,pass,name);
	}
}
