package com.test.Accounts.accountbook.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.Accounts.accountbook.model.dao.AccountBookDao;


@Service("accountbookService")
public class AccountBookSeriveimpl implements AccountBookService{
   
   @Autowired
   private AccountBookDao accountbookDao;

   @Override
   public int camera1(String userid) {
      return accountbookDao.camera1(userid);
   }
   
   @Override
   public int camera2(String userid) {
      return accountbookDao.camera2(userid);
   }

   @Override
   public int camera3(String userid) {
      return accountbookDao.camera3(userid);
   }

   @Override
   public int day1(String userid) {
      return accountbookDao.day1(userid);
   }

   @Override
   public int day2(String userid) {
      return accountbookDao.day2(userid);
   }

   @Override
   public int day3(String userid) {
      return accountbookDao.day3(userid);
   }

   @Override
   public int day4(String userid) {
      return accountbookDao.day4(userid);
   }

   @Override
   public int day5(String userid) {
      return accountbookDao.day5(userid);
   }

   @Override
   public int day6(String userid) {
      return accountbookDao.day6(userid);
   }

   @Override
   public int day7(String userid) {
      return accountbookDao.day7(userid);
   }
   


}