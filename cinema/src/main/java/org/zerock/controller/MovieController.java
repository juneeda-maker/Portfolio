package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	
}
