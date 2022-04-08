package com.test.Accounts.camera.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.Accounts.board.model.vo.Board;
import com.test.Accounts.camera.model.service.CameraService;
import com.test.Accounts.camera.model.vo.Camera;
import com.test.Accounts.common.Paging;
import com.test.Accounts.common.SearchDate;
import com.test.Accounts.member.model.vo.Member;
import com.test.Accounts.processBuilder.testProcessBuilder;

@Controller
public class CameraController {
   private static final Logger logger = LoggerFactory.getLogger(CameraController.class);
   
   
   
   @Autowired
   private CameraService cameraService;
   //영수증 전체 목록 출력용
   
   
//   @RequestMapping("clist.do")
//   public String noticeListMethod(Model model, HttpServletRequest request) {
////      Camera loginMember = cameraService.selectCamera(camera.getUser_id());
//      
//      
//      HttpSession session = request.getSession();
//      Member loginMember = (Member)session.getAttribute("loginMember");
//      String userid = loginMember.getUserid();
//      ArrayList<Camera> list = cameraService.selectAll(userid);
//      
//      if(list.size()>0) {
//         model.addAttribute("list", list);
//         return "camera/cameraListView";
//      }else {
//         model.addAttribute("message", "등록된 영수증 정보 없음");
//         return "common/error";
//      }
//   }
   
   //영수증 상호명으로 검색용
   @RequestMapping(value="csearchStoreName.do", method=RequestMethod.POST)
   public String cameraSearchStorenameMethod(@RequestParam("keyword") String keyword, Model model) {
      ArrayList<Camera> list = cameraService.selectSearchStorename(keyword);
      
      if(list.size() > 0) {
         model.addAttribute("list", list);
         return "camera/cameraListView";
      }else {
         model.addAttribute("message", keyword + "로 검색된 영수증 정보가 없습니다.");
         return "common/error";
      }
   }
   
   //영수증 등록날짜 검색용
   @RequestMapping(value="csearchDate.do", method=RequestMethod.POST)
   public String cameraSearchDateMethod(SearchDate date, Model model) {
      ArrayList<Camera> list = cameraService.selectSearchDate(date);
      
      if(list.size() > 0) {
         model.addAttribute("list", list);
         return "camera/cameraListView";
      }else {
         model.addAttribute("message", "해당날짜로 검색된 공지 정보가 없습니다.");
         return "common/error";
      }
   }
   
   //영수증 목록 페이지단위로 목록 조회 처리용
   @RequestMapping("clist.do")
   public ModelAndView cameraListMethod(@RequestParam(name="page", required=false) String page, 
         ModelAndView mv, HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      Member loginMember = (Member)session.getAttribute("loginMember");
      String userid = loginMember.getUserid();
      
      int currentPage = 1;
      if(page != null) {
         currentPage = Integer.parseInt(page);
      }
      
      //페이징 계산 처리 -- 별도의 클래스로 작성해서 사용해도됨
      int limit = 10; //한 페이지에 출력할 목록 갯수
      //페이지 수 계산을 위해 총 목록 갯수 조회
      int listCount = cameraService.selectListCount(userid);
      //페이지 수 계산
      //주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개가 필요함)
      int maxPage = (int)((double)listCount / limit + 0.9);
      //현재 페이지가 포함된 페이지 그룹의 시작값 지정(뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
      int startPage = (int)((double)currentPage/10 + 0.9);
      // 현재 페이지가 포함된 페이지 그룹의 끝값
      int endPage = startPage + 10 -1;
      
      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      //쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
      int startRow = (currentPage -1)* limit +1;
      int endRow = startRow + limit -1;
      Paging paging = new Paging(startRow, endRow, userid);
      //별도의 클래스 작성 끝 -----------------------------------
      
      //서비스 메소드 실행하고 결과받기
      ArrayList<Camera> list = cameraService.selectList(paging);
      
      if(list !=null && list.size() >0) {
         mv.addObject("list",list);
         mv.addObject("listCount", listCount);
         mv.addObject("maxPage", maxPage);
         mv.addObject("currentPage", currentPage);
         mv.addObject("startPage", startPage);
         mv.addObject("endPage", endPage);
         mv.addObject("limit", limit);
         
         mv.setViewName("camera/cameraListView");
      }else {
         mv.addObject("message", currentPage + "페이지 목록 조회 실패");
         mv.setViewName("common/error");
      }
      
      return mv;
   }
   @RequestMapping("cupload.do")
   public String moveCameraUploadForm() {
      return "camera/cuploadView";
   }
   @RequestMapping("moveupload.do")
   public String moveCameraUploadForm_bylist() {
      return "camera/cuploadView";
   }
   
   //영수증 상세보기 처리
   @RequestMapping("cdetail.do")
   public ModelAndView boardDetailMethod(ModelAndView mv, @RequestParam("camera_num") int camera_num, @RequestParam(name="page", required=false) String page) {
      int currentPage = 1;
      if(page != null) {
         currentPage = Integer.parseInt(page);
         
      }
      
      //해당 영수증 조회
      Camera camera = cameraService.selectCamera(camera_num);
      ArrayList<Camera> list = cameraService.selectProduct(camera_num);   
      
      if(camera != null) {
         mv.addObject("camera", camera);
         mv.addObject("currentPage", currentPage);
         mv.setViewName("camera/cameraDetailView");
         mv.addObject("product", list);
      }else {
         mv.addObject("message", camera_num + "번 영수증 조회 실패.");
         mv.setViewName("common/error");
      }
      
      return mv;
   }

   @RequestMapping("cupview.do")
   public String moveCameraUpdateView(@RequestParam("camera_num") int camera_num, @RequestParam("page") int currentPage, Model model) {
      Camera camera = cameraService.selectCamera(camera_num);

      ArrayList<Camera> list = cameraService.selectProduct(camera_num);   
      
      if(camera != null) {
         model.addAttribute("camera", camera);
         model.addAttribute("page", currentPage);
         model.addAttribute("product", list);
         System.out.println("productlist:"+ list);
         return "camera/cameraUpdateView";
      }else {
         model.addAttribute("message", camera_num + "번 영수증 수정페이지로 이동 실패.");
         return "common/error";
      }
   }

   @RequestMapping(value="cup.do", method=RequestMethod.POST)
   public String cameraUpdateMethod( HttpServletRequest request, Model model,
         @RequestParam("page") int page,
         @RequestParam(name="delFlag", required=false) String delFlag, 
         @RequestParam(name="upfile", required=false) MultipartFile mfile){
            int cleng = request.getParameterValues("product_name").length;
            Camera[] camera = new Camera[cleng];
            //업로드된 파일 저장 폴더 지정하기
            String[] itemProduct_no = request.getParameterValues("product_no");
            String[] itemArray = request.getParameterValues("product_name");
            String[] quantityArray = request.getParameterValues("product_count");
            String[] unit_priceArray = request.getParameterValues("unit_price");
            String[] priceArray = request.getParameterValues("product_price");
            int camera_num = Integer.parseInt(request.getParameter("camera_num"));
            int camera_total = Integer.parseInt(request.getParameter("camera_total"));
            
            for(int i=0; i<cleng; i++) {
               camera[i] = new Camera();
               camera[i].setProduct_no(Integer.parseInt(itemProduct_no[i]));
               camera[i].setProduct_name(itemArray[i]);
               camera[i].setProduct_count(Integer.parseInt(quantityArray[i]));
               camera[i].setUnit_price(Integer.parseInt(unit_priceArray[i]));
               camera[i].setProduct_price(Integer.parseInt(priceArray[i]));
               camera[i].setCamera_num(camera_num);
               camera[i].setCamera_total(camera_total);
            }
            //첨부 파일 수정 처리 ---------------------------
            //원래 첨부파일이 있는데 삭제를 선택한 경우
//            if(camera.getOriginal_filepath()!= null && delFlag != null && delFlag.equals("yes")) {
               //저장 폴더에서 해당 파일을 삭제함
//               new File(savePath + "\\" + camera).delete();
//               //board 의 파일정보도 제거함
//               camera.setOriginal_filepath(null);
//               camera.setRename_filepath(null);
      
            
            //새로운 첨부파일ㅇ ㅣ있을 때 
//            if(!mfile.isEmpty()) {
//               //저장 폴더의 이전 파일을 삭제함
//               if(camera.getOriginal_filepath() !=null) {
//                  //저장 폴더에서 해당 파일을 삭제함
//                  new File(savePath + "\\" + camera.getRename_filepath()).delete();
//                  //board 의 파일정보도 제거함
//                  camera.setOriginal_filepath(null);
//                  camera.setRename_filepath(null);
//               }
//               //이전 첨부파일이 없는 경우 --------------------
//               String fileName = mfile.getOriginalFilename();
//               //이름 바꾸기 처리 : 년 월 시 분 초.확장자
//               if(fileName != null && fileName.length() >0) {
//                  //바꿀 파일명에 대한 문자열 만들기
//                  //공지글 등록 요청시점의 날짜정보를 이용함
//                  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//                  //변경할 파일 이름 만들기
//                  String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
//                  //원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
//                  renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
//                  
//                  //파일객체 만들기
//                  File originFile = new File(savePath + "\\" + fileName);
//                  File renameFile = new File(savePath + "\\" + renameFileName);
//                  
//                  //업로드 파일 저장시키고, 바로 이름바꾸기 실행함
//                  try {
//                     mfile.transferTo(renameFile);
//                  } catch (Exception e) {
//                     e.printStackTrace();
//                     model.addAttribute("message", "전송파일 저장 실패");
//                     return "common/error";
//                  }
//                  camera.setOriginal_filepath(fileName);
//                  camera.setRename_filepath(renameFileName);
//               }
//               }
            
            // -----------------------------------------
            //서비스 메소드 실행시키고 결과받아서 성공|실패 페이지 내보내기
            if(cameraService.updateCamera(camera) > 0 && cameraService.updateProduct(camera)>0) {
               //원글 수정 성공시 상세보기 페이지 내보내는 경우
               model.addAttribute("page",page);
               model.addAttribute("camera_num", camera[0].getCamera_num());
               return "redirect:cdetail.do";
            }else {
               model.addAttribute("message", camera[0].getCamera_num() + "번 영수증 수정 실패");
               return "common/error";
            }
         }


   @RequestMapping("cdel.do")
   public String cameraDeleteMethod(Camera camera, HttpServletRequest request, Model model) {
      
      cameraService.deleteCamera(camera);
         

         return "redirect:clist.do?page=1";
   
   }
   //영수증 이미지파일 ocr에 전송
   @RequestMapping("csendfile.do")
   public String cameraSendFileMethod(Camera camera, HttpServletRequest request, Model model, @RequestParam(name="upfile", required=false) MultipartFile mfile) {
//      카메라upfiles폴더에 이미지 저장--------------------
      String fileName = mfile.getOriginalFilename();
      String savePath = request.getSession().getServletContext().getRealPath("resources/camera_upfiles");
      
      
      java.sql.Date camera_date=  java.sql.Date .valueOf(request.getParameter("camera_date"));
      
      
      camera.setCamera_date(camera_date);
      HttpSession session = request.getSession();
      Member loginMember = (Member)session.getAttribute("loginMember");
      String userid = loginMember.getUserid();
      camera.setUser_id(userid);
      //이름 바꾸기 처리 : 년 월 시 분 초.확장자
      if(fileName != null && fileName.length() >0) {
         //바꿀 파일명에 대한 문자열 만들기
         //공지글 등록 요청시점의 날짜정보를 이용함
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
         //변경할 파일 이름 만들기
         String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
         //원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
         renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
         
         //파일객체 만들기
         File originFile = new File(savePath + "\\" + fileName);
         File renameFile = new File(savePath + "\\" + renameFileName);
         
         //업로드 파일 저장시키고, 바로 이름바꾸기 실행함
         try {
            mfile.transferTo(originFile);
            camera.setOriginal_filepath(fileName);
         } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "전송파일 저장 실패");
            return "common/error";
         }
      
      }
      cameraService.insertCamera(camera);
      testProcessBuilder tb = new testProcessBuilder();
      tb.tpb();
         //원글 수정 성공시 상세보기 페이지 내보내는 경우
      
         return "camera/cuploadView";

   }
}