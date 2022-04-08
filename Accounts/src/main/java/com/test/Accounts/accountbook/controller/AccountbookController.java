package com.test.Accounts.accountbook.controller;


import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.Accounts.accountbook.model.service.AccountBookService;

@Controller
public class AccountbookController {

   private static final Logger logger = LoggerFactory.getLogger(AccountbookController.class);

   @Autowired
   private AccountBookService accountbookService;

   @RequestMapping("accountbook.do")
   public String moveAccountPage() {

      return "accountbook/accountbook";
   }

   @RequestMapping("calendarPage.do")
   public String moveCalenderPage() {

      return "calender/calendar";
   }

   @RequestMapping("accountbookerror.do")
   public String accounterror() {

      return "accountbook/accountbookerror";
   }
   
   @RequestMapping(value="acc.do", method = RequestMethod.POST)
   @ResponseBody
   public int camera1(@RequestParam("userid") String userid, 
      HttpServletResponse response){      
               
      int aa = accountbookService.camera1(userid);

      return aa;
   }
   
   @RequestMapping(value="acd.do", method = RequestMethod.POST)
   @ResponseBody
   public int camera2(@RequestParam("userid") String userid, 
      HttpServletResponse response){      
               
      int bb = accountbookService.camera2(userid);

      return bb;
   }
   
   @RequestMapping(value="ace.do", method = RequestMethod.POST)
   @ResponseBody
   public int camera3(@RequestParam("userid") String userid, 
      HttpServletResponse response){      
               
      int cc = accountbookService.camera3(userid);

      return cc;
   }
   
   @RequestMapping(value="day1.do", method = RequestMethod.POST)
   @ResponseBody
   public int day1(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day1(userid);
      
      return dd;
      
      
   }
   @RequestMapping(value="day2.do", method = RequestMethod.POST)
   @ResponseBody
   public int day2(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day2(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   @RequestMapping(value="day3.do", method = RequestMethod.POST)
   @ResponseBody
   public int day3(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day3(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   @RequestMapping(value="day4.do", method = RequestMethod.POST)
   @ResponseBody
   public int day4(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day4(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   @RequestMapping(value="day5.do", method = RequestMethod.POST)
   @ResponseBody
   public int day5(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day5(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   @RequestMapping(value="day6.do", method = RequestMethod.POST)
   @ResponseBody
   public int day6(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day6(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   @RequestMapping(value="day7.do", method = RequestMethod.POST)
   @ResponseBody
   public int day7(@RequestParam("userid") String userid, HttpServletResponse response){      
               
      int dd = accountbookService.day7(userid);
      
      System.out.println(dd);
      
      return dd;
      
      
   }
   

    
}
