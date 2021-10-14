package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.security.CustomUserDetailsService;
import org.zerock.service.SignupServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	private CustomUserDetailsService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model)
	{
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model)
	{
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		
		if(error != null) {
			model.addAttribute("error", "N");
		}
		if(logout != null)
		{
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
}
