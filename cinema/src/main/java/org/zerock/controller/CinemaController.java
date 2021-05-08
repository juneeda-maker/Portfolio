package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class CinemaController {
	
	@RequestMapping("/home") 
	public String home(Model model) 
	{ 
		log.info("home");
		return "home"; 
	}
	
	@RequestMapping("/list")
	public String pick(Model model)
	{
		log.info("list");
		return "list";
	}
	
	@RequestMapping("/community")
	public String community(Model model)
	{
		log.info("community");
		return "community";
	}
	
}
