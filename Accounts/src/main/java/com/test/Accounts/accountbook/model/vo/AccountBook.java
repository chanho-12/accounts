package com.test.Accounts.accountbook.model.vo;

import java.sql.Date;

public class AccountBook implements java.io.Serializable {
   private static final long serialVersionUID = -3065713445874754861L;
   
   public AccountBook() {
      super();
   }
   
   private int account_num ; // 가계부 작성번호
   private String accountbookwriter;   // 사용자 아이디 
   private int camera_num;   // 카메라 영수증 번호 
   private int cameara_total1;   // 하루 영수증 합계
   private int cameara_total2;   // 일주일 영수증 합계
   private int cameara_total3;   // 한달 영수증 합꼐 
   private java.sql.Date account_date; // 등록 날짜
   private int day1; //월요일 사용량
   private int day2;    //화요일 사용량
   private int day3; //수요일 사용량
   private int day4; //목요일 사용량
   private int day5; //금요일 사용량
   private int day6; //토요일 사용량
   private int day7; //일요일 사용량
   
   

   public AccountBook(int account_num, String accountbookwriter, int camera_num, int cameara_total1,
         int cameara_total2, int cameara_total3, Date account_date, int day1, int day2, int day3, int day4, int day5,
         int day6, int day7) {
      super();
      this.account_num = account_num;
      this.accountbookwriter = accountbookwriter;
      this.camera_num = camera_num;
      this.cameara_total1 = cameara_total1;
      this.cameara_total2 = cameara_total2;
      this.cameara_total3 = cameara_total3;
      this.account_date = account_date;
      this.day1 = day1;
      this.day2 = day2;
      this.day3 = day3;
      this.day4 = day4;
      this.day5 = day5;
      this.day6 = day6;
      this.day7 = day7;
   }

   @Override
   public String toString() {
      return "AccountBook [account_num=" + account_num + ", accountbookwriter=" + accountbookwriter + ", camera_num="
            + camera_num + ", cameara_total1=" + cameara_total1 + ", cameara_total2=" + cameara_total2
            + ", cameara_total3=" + cameara_total3 + ", account_date=" + account_date + ", day1=" + day1 + ", day2="
            + day2 + ", day3=" + day3 + ", day4=" + day4 + ", day5=" + day5 + ", day6=" + day6 + ", day7=" + day7
            + "]";
   }

   public int getDay1() {
      return day1;
   }

   public void setDay1(int day1) {
      this.day1 = day1;
   }

   public int getDay2() {
      return day2;
   }

   public void setDay2(int day2) {
      this.day2 = day2;
   }

   public int getDay3() {
      return day3;
   }

   public void setDay3(int day3) {
      this.day3 = day3;
   }

   public int getDay4() {
      return day4;
   }

   public void setDay4(int day4) {
      this.day4 = day4;
   }

   public int getDay5() {
      return day5;
   }

   public void setDay5(int day5) {
      this.day5 = day5;
   }

   public int getDay6() {
      return day6;
   }

   public void setDay6(int day6) {
      this.day6 = day6;
   }

   public int getDay7() {
      return day7;
   }

   public void setDay7(int day7) {
      this.day7 = day7;
   }
   
   public int getAccount_num() {
      return account_num;
   }
   public void setAccount_num(int account_num) {
      this.account_num = account_num;
   }
   
   public int getCamera_num() {
      return camera_num;
   }
   public void setCamera_num(int camera_num) {
      this.camera_num = camera_num;
   }
   public int getCameara_total1() {
      return cameara_total1;
   }
   public void setCameara_total1(int cameara_total1) {
      this.cameara_total1 = cameara_total1;
   }
   public int getCameara_total2() {
      return cameara_total2;
   }
   public void setCameara_total2(int cameara_total2) {
      this.cameara_total2 = cameara_total2;
   }
   public int getCameara_total3() {
      return cameara_total3;
   }
   public void setCameara_total3(int cameara_total3) {
      this.cameara_total3 = cameara_total3;
   }
   public static long getSerialversionuid() {
      return serialVersionUID;
   }
   public String getAccountbookwriter() {
      return accountbookwriter;
   }
   public void setAccountbookwriter(String accountbookwriter) {
      this.accountbookwriter = accountbookwriter;
   }

   public java.sql.Date getAccount_date() {
      return account_date;
   }

   public void setAccount_date(java.sql.Date account_date) {
      this.account_date = account_date;
   }

   
   
   
   
   
   
   
   
   
}