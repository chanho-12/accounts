package com.test.Accounts.camera.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.Accounts.board.model.vo.Board;
import com.test.Accounts.camera.model.vo.Camera;
import com.test.Accounts.common.Paging;
import com.test.Accounts.common.SearchDate;

@Repository("cameraDao")
public class CameraDao {
   @Autowired
   private SqlSessionTemplate session;
   
   



   public Camera selectCamera(int camera_num) {
      return session.selectOne("cameraMapper.selectCamera", camera_num);
   }


   public ArrayList<Camera> selectSearchStorename(String keyword) {
      List<Camera> list = session.selectList("cameraMapper.searchStorename", keyword);
      return (ArrayList<Camera>)list;
   }


   public ArrayList<Camera> selectSearchDate(SearchDate date) {
      List<Camera> list = session.selectList("cameraMapper.searchDate", date);
      return (ArrayList<Camera>)list;
   }


   public int selectListCount(String userid) {
      return session.selectOne("cameraMapper.getListCount", userid);
   }


   public ArrayList<Camera> selectList(Paging page) {
      List<Camera> list = session.selectList("cameraMapper.selectList", page);
      return (ArrayList<Camera>)list;
   }


   public int updateCamera(Camera[] camera) {
      int result = 0;
      
      for(Camera c: camera) {
         result = session.update("cameraMapper.updateCamera", c);
         
      }
      return result;
   }


   public ArrayList<Camera> selectProduct(int camera_num) {
      List<Camera> list = session.selectList("cameraMapper.selectProduct", camera_num);
      return (ArrayList<Camera>)list;
   }


   public int updateProduct(Camera[] camera) {
      int result = 0;
      
      for(Camera c: camera) {
         result = session.update("cameraMapper.updateCamera", c);
         
      }
      return result;
   }


   public int deleteCamera(Camera camera) {
      return session.delete("cameraMapper.deleteCamera", camera);
   }


   public int insertCamera(Camera camera) {
      return session.insert("cameraMapper.insertCamera", camera);
   }

   
}