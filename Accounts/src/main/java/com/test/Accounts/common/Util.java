package com.test.Accounts.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.test.Accounts.calendar.model.vo.CalDto;

public class Util {
	
	
	//토일색상
	public static String fontColor(int dayOfWeek, int i){
		String color="";
		if((dayOfWeek-1+i)%7==0){
			color="blue";
		}else if((dayOfWeek-1+i)%7==1){
			color="red";
		}else{
			color="black";
		}
		return color;
	}
	
	//1자리 2자리로
	public static String isTwo(String msg) {
		return msg.length()<2?"0"+msg:msg;
	}
	

	private CalDto dto;
	
	
	
	public static String getCalView(int i, List<CalDto> clist) {
		
		String d=isTwo(i+"");
		String res="";
		try {
		for(CalDto dto : clist) {
			if(dto.getMdate().substring(6,8).equals(d)) {
				res += "<p>"+((dto.getTitle().length()>6)?(dto.getTitle().substring(0,6)+"..."):(dto.getTitle()))+"</p>";
			}
		}
		}catch(NullPointerException e){
			System.out.println("널포인트익셉션");
		}
		return res;
	}

	
	public CalDto getDto() {
		return dto;
	}

	public void setDto(CalDto dto) {
		this.dto = dto;
	}
	
	
	
	
	
	
	
}
