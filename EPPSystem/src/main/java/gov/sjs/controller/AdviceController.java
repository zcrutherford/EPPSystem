package gov.sjs.controller;

import gov.sjs.po.Advice;
import gov.sjs.po.DataTablePo;
import gov.sjs.service.IAdviceService;

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
	@RequestMapping("/getAdviceByCondition.do")
	public Advice getAdviceByCondition(Advice advice) {
		List<Advice> list = iadviceService.getAdviceByCondition(advice,"0","1");
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping("/addAdvice.do")
	public String addAdvice(Advice advice) {
		iadviceService.addAdvice(advice);
		return "success";
	}
	
	@RequestMapping("/gotoNewAdvicePage.do")
	public String gotoNewAdvicePage(HttpServletRequest request) {
		return "newAdvice";
	}
	
	@RequestMapping("/gotoAdviceManagePage.do")
	public String gotoAdviceManagePage(String daId,String ms,HttpServletRequest request) {
		request.setAttribute("daId", daId);
		request.setAttribute("ms", ms);
		return "adviceManage";
	}
}
