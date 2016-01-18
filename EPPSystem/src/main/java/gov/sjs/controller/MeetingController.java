package gov.sjs.controller;

import gov.sjs.po.Meeting;
import gov.sjs.service.IMeetingService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/meeting")
public class MeetingController {
	
	@Autowired
	private IMeetingService imeetingService;
	
	@RequestMapping("/gotoMeeting.do")
	public String gotoMeetingPage(String ms,HttpServletRequest request) {
		
		List<Meeting> list = imeetingService.getmtByCondition(ms);
		request.setAttribute("mtlist", list);
		request.setAttribute("ms", ms);
		return "meeting";
	}
	
	@ResponseBody
	@RequestMapping("/getMtByCondition.do")
	public List<Meeting> getMtByCondition(String ms) {
		List<Meeting> list = imeetingService.getmtByCondition(ms);
		return list;
	}
	
	@RequestMapping("/gotoWelcome.do")
	public String gotoWelcomePage() {
		return "welcome";
	}
}
