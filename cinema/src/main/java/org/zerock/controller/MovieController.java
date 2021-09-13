package org.zerock.controller;

import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.service.MovieServiceImpl;

@Controller
public class MovieController {
	
	private MovieServiceImpl serviceimpl;
		
		@Autowired(required = false)
		public MovieController(MovieServiceImpl serviceimpl)
		{
			this.serviceimpl = serviceimpl;
		}
		
		@RequestMapping(value="search.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String getApi(@RequestParam(defaultValue="") String keyword)
		{
			return serviceimpl.findkeyword(keyword);
		}
		
		/*
		@RequestMapping(value="result.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String getResult(@RequestParam(defaultValue="") String kerword, String title)
		{
			return serviceimpl.link_btn(title);
		}
		*/
		
		@RequestMapping("/result") 
		public String result(Model model) 
		{ 
			return "result"; 
		}
		
		
		@RequestMapping(value="result", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String getResult(@RequestParam(defaultValue="") String keyword) //@RequestParam jsp form 의 name 을 가져옴
		{
			return serviceimpl.findkeyword(keyword);
		}
		
	
	
}
