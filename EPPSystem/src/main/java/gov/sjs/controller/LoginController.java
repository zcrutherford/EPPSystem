package gov.sjs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/index.do")
	public String gotoIndex() {
		return "../../index";
	}
	
	@RequestMapping("/loginPage.do")
	public String gotoLogin() {
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping("/signin.do")
	public String login() {
		return "ok";
	}
}
