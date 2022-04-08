package com.test.Accounts.camera.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.Accounts.camera.model.dao.CameraDao;
import com.test.Accounts.camera.model.vo.Camera;
import com.test.Accounts.common.Paging;
import com.test.Accounts.common.SearchDate;

@Service("cameraService")
public class CameraServiceImpl implements CameraService{
   @Autowired
   private CameraDao cameraDao;
   


   @Override
   public Camera selectCamera(int camera_num) {
      return cameraDao.selectCamera(camera_num);
   }

   @Override
   public int insertCamera(Camera camera) {
      return cameraDao.insertCamera(camera);
   }

   @Override
   public int updateCamera(Camera[] camera) {
      return cameraDao.updateCamera(camera);
   }
   
   @Override
   public int updateProduct(Camera[] camera) {
      return cameraDao.updateProduct(camera);
   }

   @Override
   public int deleteCamera(Camera camera) {
      return cameraDao.deleteCamera(camera);
   }

   @Override
   public ArrayList<Camera> selectSearchStorename(String keyword) {
      return cameraDao.selectSearchStorename(keyword);
   }

   @Override
   public ArrayList<Camera> selectSearchDate(SearchDate date) {
      return cameraDao.selectSearchDate(date);
   }

   @Override
   public int selectListCount(String userid) {
      return cameraDao.selectListCount(userid);
   }

   @Override
   public ArrayList<Camera> selectList(Paging page) {
      return cameraDao.selectList(page);
   }

   @Override
   public ArrayList<Camera> selectProduct(int camera_num) {
      return cameraDao.selectProduct(camera_num);
   }

//   @Override
//   public ArrayList<Camera> selectAll(String userid) {
//      // TODO Auto-generated method stub
//      return null;
//   }

}