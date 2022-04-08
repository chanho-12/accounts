package com.test.Accounts.camera.model.service;

import java.util.ArrayList;
import java.util.List;

import com.test.Accounts.board.model.vo.Board;
import com.test.Accounts.camera.model.vo.Camera;
import com.test.Accounts.common.Paging;
import com.test.Accounts.common.SearchDate;

public interface CameraService {
   //   ArrayList<Camera> selectAll(String userid);
   ArrayList<Camera> selectList(Paging page); //한 페이지에 출력할 게시글 조회용
   Camera selectCamera(int camera_num);
   int insertCamera(Camera camera);
   int updateCamera(Camera[] camera);
   int updateProduct(Camera[] camera);
   int deleteCamera(Camera camera);
   ArrayList<Camera> selectSearchStorename(String keyword);
   ArrayList<Camera> selectSearchDate(SearchDate date);
   int selectListCount(String userid);  //총 게시글 갯수 조회용 (페이지 수 계산용)
   ArrayList<Camera> selectProduct(int camera_num);
}
