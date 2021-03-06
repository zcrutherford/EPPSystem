package gov.sjs.controller;

import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;
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
	public String gotoMeetingPage(String ms,String mstype,HttpServletRequest request) {
		List<MeetingTimes> list = imeetingService.getmtByCondition(ms);
		request.setAttribute("mtlist", list);
		request.setAttribute("ms", ms);
		request.setAttribute("mstype", mstype);
		return "meeting";
	}
	
	@ResponseBody
	@RequestMapping("/getMtByCondition.do")
	public List<MeetingTimes> getMtByCondition(String ms) {
		List<MeetingTimes> list = imeetingService.getmtByCondition(ms);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getMs.do")
	public List<MeetingSession> getMs() {
		List<MeetingSession> list = imeetingService.getMeetingSession();
		return list;
	}
	
	@RequestMapping("/gotoWelcome.do")
	public String gotoWelcomePage() {
		return "welcome";
	}
}
