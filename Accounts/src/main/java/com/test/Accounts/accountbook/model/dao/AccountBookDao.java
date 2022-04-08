package com.test.Accounts.accountbook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("accountbookDao")
public class AccountBookDao {

   @Autowired
   private SqlSessionTemplate session;

   public AccountBookDao() {}

   public int camera1(String userid) {
      return session.selectOne("accountbookMapper.camera1", userid);
   }

   public int camera2(String userid) {
      return session.selectOne("accountbookMapper.camera2", userid);
   }

   public int camera3(String userid) {
      return session.selectOne("accountbookMapper.camera3", userid);
   }
   
   public int day1(String userid) {
      return session.selectOne("accountbookMapper.day1", userid);
   }
   
   public int day2(String userid) {
      return session.selectOne("accountbookMapper.day2", userid);
   }
   
   public int day3(String userid) {
      return session.selectOne("accountbookMapper.day3", userid);
   }
   
   public int day4(String userid) {
      return session.selectOne("accountbookMapper.day4", userid);
   }
   
   public int day5(String userid) {
      return session.selectOne("accountbookMapper.day5", userid);
   }
   
   public int day6(String userid) {
      return session.selectOne("accountbookMapper.day6", userid);
   }
   
   public int day7(String userid) {
      return session.selectOne("accountbookMapper.day7", userid);
   }

   
   
}