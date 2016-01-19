package gov.sjs.controller;


import gov.sjs.po.Menu;
import gov.sjs.service.IMenuService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private IMenuService menuService;
	
	@ResponseBody
	@RequestMapping("/getmenu.do")
	public String getAllMenu() {
		List<Menu> list = menuService.getAllMenu();
		String result = JSON.toJSONString(list);
		System.out.println(result);
		return result;
	}
}
