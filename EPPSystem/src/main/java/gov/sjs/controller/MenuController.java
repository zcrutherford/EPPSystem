package gov.sjs.controller;


import gov.sjs.po.DataTablePo;
import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;
import gov.sjs.po.Menu;
import gov.sjs.service.IMeetingService;
import gov.sjs.service.IMenuService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private IMenuService menuService;
	
	@Autowired
	private IMeetingService meetingService;
	
	@ResponseBody
	@RequestMapping("/getmenu.do")
	public List<Menu> getAllMenu() {
		List<Menu> list = menuService.getAllMenu();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getMeetingTime.do")
	public DataTablePo getMeetingTime(HttpServletRequest request,MeetingTimes meeting) {
		int displayStart = Integer.parseInt(request.getParameter("start"));
		int displayLength = Integer.parseInt(request.getParameter("length"));
		List<MeetingTimes> list = meetingService.getMeetingTimes(meeting,displayStart,displayLength);
		DataTablePo obj = new DataTablePo();
		obj.setData(list);
		obj.setRecordsFiltered(meetingService.getMeetingTimesCount(meeting));
		return obj;
	}
	
	@ResponseBody
	@RequestMapping("/deleteMeetingTime.do")
	public String deleteMeetingTime(String mtId) {
		meetingService.deleteMeetingTime(mtId);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/addMs.do")
	public String addMs(MeetingSession meeting) {
		meetingService.addMs(meeting);
		Menu mainMenu = new Menu("0",meeting.getSessionName(),"");
		menuService.addMenu(mainMenu);
		Menu menu = menuService.getMenu(mainMenu);
		Menu menu1 = new Menu(menu.getId(),"开会期间","meeting/gotoMeeting.do?ms="+meeting.getMsId()+"&mstype=on");
		Menu menu2 = new Menu(menu.getId(),"闭会期间","meeting/gotoMeeting.do?ms="+meeting.getMsId()+"&mstype=off");
		menuService.addMenu(menu1);
		menuService.addMenu(menu2);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/addMt.do")
	public String addMt(MeetingTimes meeting) {
		meetingService.addMt(meeting);
		return "success";
	}

	@RequestMapping("/gotoAddMs.do")
	public String gotoAddMs() {
		return "newMs";
	}
	
	@RequestMapping("/gotoAddMt.do")
	public String gotoAddMt() {
		return "newMt";
	}
	
	@RequestMapping("/gotoMenu.do")
	public String gotoMenuPage() {
		return "menu";
	}
	
	@RequestMapping("/gotoMeetingTime.do")
	public String gotoMeetingTimePage() {
		return "meetingTime";
	}
}
