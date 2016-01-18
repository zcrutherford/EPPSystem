package gov.sjs.controller;

import gov.sjs.po.Advice;
import gov.sjs.po.DataTablePo;
import gov.sjs.po.MeetingSession;
import gov.sjs.service.IAdviceService;
import gov.sjs.service.IMeetingService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/advice")
public class AdviceController {

	@Autowired
	private IAdviceService iadviceService;
	
	@Autowired
	private IMeetingService imeetingService;
	
	@ResponseBody
	@RequestMapping("/getAdvice.do")
	public DataTablePo getAdviceByCondition(Advice advice,HttpServletRequest request) {
		int displayStart = Integer.parseInt(request.getParameter("start"));
		int displayLength = Integer.parseInt(request.getParameter("length"));
		List<Advice> list = iadviceService.getAdviceByCondition(advice,String.valueOf(displayStart),String.valueOf(displayLength));
		DataTablePo obj = new DataTablePo();
		obj.setData(list);
		obj.setRecordsFiltered(iadviceService.getAdviceCountByCondition(advice));
		return obj;
	}
	
	@ResponseBody
	@RequestMapping("/addAdvice.do")
	public String addAdvice(Advice advice) {
		advice.setMsType("type1");
		iadviceService.addAdvice(advice);
		return "success";
	}
	
	@RequestMapping("/gotoNewAdvicePage.do")
	public String gotoNewAdvicePage(HttpServletRequest request) {
		List<MeetingSession> list = imeetingService.getMeetingSession();
		request.setAttribute("mslist", list);
		return "newAdvice";
	}
}
