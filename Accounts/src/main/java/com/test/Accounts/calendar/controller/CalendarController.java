package com.test.Accounts.calendar.controller;


import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.Accounts.calendar.model.service.ICalService;
import com.test.Accounts.calendar.model.vo.CalDto;
import com.test.Accounts.common.Util;
import com.test.Accounts.member.model.vo.Member;


@Controller
public class CalendarController {
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private ICalService calService;
    
	
	@RequestMapping(value = "calendar.do", method=RequestMethod.GET)
	public String calendar(HttpServletRequest request, Locale locale, Model model, String year, String month) {
		logger.info("달력보기{}.", locale);
		
		HttpSession session=request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getUserid();
				
//		String id = "K001";
		
		//캘린더요청시 연월없으면 현재달보여줌
		if(year==null || month==null) {  //받은년월없으면
			Calendar cal=Calendar.getInstance();  //캘린더객체생성해서
			year=cal.get(Calendar.YEAR)+"";  //공백넣어주고 담고
			month=cal.get(Calendar.MONTH)+1+"";  //공백넣고담고
		}else {
			int yearInt=Integer.parseInt(year);  //크기가늠위해integer바꾸고
			int monthInt=Integer.parseInt(month);
			
			if(monthInt>12){  //달이12넘으면 1로돌아가서 년추가
				monthInt=1;
				yearInt++;
			}
			if(monthInt<1){  //달이1아래면12로가고 년마이너스
				monthInt=12;
				yearInt--;
			}
			
			year=yearInt+"";  //그걸 똑같이공백넣어서 year에추가
			month=String.valueOf(monthInt);
//			month=monthInt+"";  //똑같이담아줌
		}
		
		//캘린더에 일정표시
		String yyyyMM=year+Util.isTwo(month);  //년도와월(2자리만들어서)넣어줌
		List<CalDto> clist=calService.calViewList(id, yyyyMM);
		model.addAttribute("clist", clist); //뷰리졸브에이거전송
		
		return "calender/calendar";
	}
	
	@RequestMapping(value = "calendar2.do", method=RequestMethod.GET)
	public String calendar2(HttpServletRequest request, Locale locale, Model model, String year, String month) {
		logger.info("달력보기{}.", locale);
		
		HttpSession session=request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getUserid();
				
//		String id = "K001";
		
		//캘린더요청시 연월없으면 현재달보여줌
		if(year==null || month==null) {  //받은년월없으면
			Calendar cal=Calendar.getInstance();  //캘린더객체생성해서
			year=cal.get(Calendar.YEAR)+"";  //공백넣어주고 담고
			month=cal.get(Calendar.MONTH)+1+"";  //공백넣고담고
		}else {
			int yearInt=Integer.parseInt(year);  //크기가늠위해integer바꾸고
			int monthInt=Integer.parseInt(month);
			
			if(monthInt>12){  //달이12넘으면 1로돌아가서 년추가
				monthInt=1;
				yearInt++;
			}
			if(monthInt<1){  //달이1아래면12로가고 년마이너스
				monthInt=12;
				yearInt--;
			}
			
			year=yearInt+"";  //그걸 똑같이공백넣어서 year에추가
			month=String.valueOf(monthInt);
//			month=monthInt+"";  //똑같이담아줌
		}
		
		//캘린더에 일정표시
		String yyyyMM=year+Util.isTwo(month);  //년도와월(2자리만들어서)넣어줌
		List<CalDto> clist=calService.calViewList(id, yyyyMM);
		model.addAttribute("clist", clist); //뷰리졸브에이거전송
		
		return "calender/calendar2";
	}
	
	@RequestMapping(value = "/insertCalForm.do", method=RequestMethod.GET)
	public String insertCalForm(Locale locale, Model model) {
		logger.info("추가폼이동{}.", locale);
		
		return "calender/insertCalForm";
		
	}
	
	
	@RequestMapping(value="/insertCalBoard.do", method=RequestMethod.POST)
	public String insertCalBoard(CalDto dto, Locale locale, Model model) {
		logger.info("추가하기{}.", locale);
		
		String mdate=dto.getYear()
				+Util.isTwo(dto.getMonth())
				+Util.isTwo(dto.getDate())
				+Util.isTwo(dto.getHour())
				+Util.isTwo(dto.getMin());
		
		boolean isS=calService.insertCal(new CalDto(0, dto.getId(), dto.getTitle(), dto.getContent(), mdate, null));
		
		if(isS) {
			return "redirect:calendar.do?year="+dto.getYear()+"&month="+dto.getMonth();
		}else {
			model.addAttribute("message", "등록실패");
			return "common/error";
		}
	}
		
	
    
	@RequestMapping(value = "calBoardList.do", method=RequestMethod.GET)
	public String calBoardList(HttpServletRequest request, Locale locale, Model model, /*String year, String month, String date*/
			@RequestParam Map<String,String> ymd) {
		logger.info("목록보기{}.", locale);
		
		HttpSession session=request.getSession();
		
		if(ymd==null||ymd.get("year")==null) {
			ymd=(Map<String,String>)session.getAttribute("ymd");
		}else {
			session.setAttribute("ymd", ymd);
		}				
		
//		String yyyyMMdd=year+(month.length()<2?"0"+month:month)+(date.length()<2?"0"+date:date);
		String yyyyMMdd = ymd.get("year")
				+Util.isTwo(ymd.get("month"))
				+Util.isTwo(ymd.get("date"));
//		String yyyyMMdd=ymd.get("year")
//				+Util.isTwo(ymd.get("month"))
//				+Util.isTwo(ymd.get("Date"));
		
//		HttpSession session=request.getSession();
//		String id = (String)session.getAttribute("userid");
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getUserid();
//		String id="user02";
		
		List<CalDto> list = calService.calBoardList(id, yyyyMMdd);
		model.addAttribute("list", list);
		
		return "calender/calBoardList";
		
	}
	
	
	@RequestMapping(value = "/calMuldel.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String calMuldel(String[] seq, CalDto dto, Locale locale, Model model) {
		logger.info("삭제하기{}.", locale);
		
//		String source="year="+dto.getYear()+"&month="+dto.getMonth()
//					+"&date="+dto.getDate();
		
		boolean isS=calService.calMuldel(seq);
		if(isS) {
//			return "redirect:calBoardList.do?"+source;
			return "redirect:calBoardList.do";
		}else {
			model.addAttribute("message","삭제실패");
			return "common/error";
		}		
	}
	
	
	@RequestMapping(value = "/calDetail.do", method=RequestMethod.GET)
	public String calDetail(int seq, Locale locale, Model model) {
		logger.info("상세내용보기{}.", locale);
		CalDto dto = calService.calDetail(seq);
		model.addAttribute("dto", dto);
		return "calender/calDetail";
		
	}
	
	
	@RequestMapping(value = "/updateForm.do", method=RequestMethod.GET)
	public String updateForm(int seq, Locale locale, Model model) {
		logger.info("수정폼이동{}.", locale);	
		
		CalDto dto=calService.calDetail(seq);
		model.addAttribute("dto",dto);		
		return "calender/calUpdateForm";
		
	}
	
	
	@RequestMapping(value = "/calUpdate.do", method=RequestMethod.POST)
	public String calUpdate(CalDto dto, Locale locale, Model model) {
		logger.info("수정하기{}.", locale);
		
		String mdate=dto.getYear()
				+Util.isTwo(dto.getMonth())
				+Util.isTwo(dto.getDate())
				+Util.isTwo(dto.getHour())
				+Util.isTwo(dto.getMin());
		
		boolean isS=calService.calUpdate(new CalDto(dto.getSeq(), null, dto.getTitle(), dto.getContent(),
										mdate, null));
		
		if(isS) {
			return "redirect:calDetail.do?seq="+dto.getSeq();
			
		}else {
			model.addAttribute("message", "수정실패");
			return "common/error";
		}
	}
	
//	@RequestMapping(value="ntop33.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String noticeNewTop3Method(HttpServletResponse response) throws UnsupportedEncodingException {
//		String id = "K001";
//		
//		//최근등록공지글 3개조회먼저해오기
//		ArrayList<CalDto> clist = calService.calViewList(id);
//		
//		//전소용 json객체 준비
//		JSONObject sendJson = new JSONObject();
//		//list옮길 json배열 준비
//		JSONArray jarr = new JSONArray();
//		
//		//list를 jarr로 옮기기(복사)
//		for(CalDto caldto : clist) {
//			//notice 필드값 저장용 json객체 만들고
//			JSONObject job = new JSONObject();
//			
//			//json객체저장할때 put, 대부분map구조니까 json이
//			job.put("noticeno", notice.getNoticeno());
//			job.put("noticetitle", URLEncoder.encode(notice.getNoticetitle(), "utf-8"));
//			//한글은 인코딩 디코딩해야된다 여기서인코딩 저기받는뷰?에서 디코딩
//			job.put("noticedate", notice.getNoticedate().toString());  //스트링으로안바꾸면null로됨 날짜만
//			
//			jarr.add(job); //배열에저장
//		}
//		//전송용객체에 jarr을 담음
//		sendJson.put("list", jarr);
//		
//		return sendJson.toJSONString(); //제이슨객체를 제이슨문자열형태로 보냄
//		//뷰리졸버에게 리턴됨
//		
//	}
	
	@ResponseBody
	@RequestMapping(value = "/calCountAjax.do", method=RequestMethod.POST)
	public String calCountAjax(HttpServletRequest request, @RequestParam("yyyyMMdd") String ymd, Locale locale, Model model) {
		logger.info("갯수보여주기 {}.", locale);
		
		HttpSession session=request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getUserid();
//		String id="K001";
		
		
		int count=calService.calCount(id, ymd);
		return count+"";
		
	}
    
}









