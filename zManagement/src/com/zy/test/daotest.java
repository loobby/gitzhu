package com.zy.test;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zy.dao.ItemsMapp;

public class daotest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring.xml");
		ItemsMapp itemsMapp = (ItemsMapp) ac.getBean("itemsMapp");
		System.out.println(itemsMapp.sidlogin("10101"));
		
	}

}
