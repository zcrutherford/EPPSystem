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
		/*List<Menu> list = new ArrayList<Menu>();
		for(int i = 1; i < 10;i++) {
			Menu menu = new Menu();
			menu.setName("menu"+i);
			menu.setId(i + "");
			menu.setParent("0");
			menu.setUrl("url" + i);
			list.add(menu);
		}
		int j = 0;
		for(Menu menu:list) {
			if(j%3 == 0) {
				menu.setParent("1");
			}
			j++;
		}*/
		List<Menu> list = menuService.getAllMenu();
		String result = JSON.toJSONString(list);
		System.out.println(result);
		return result;
	}
}
