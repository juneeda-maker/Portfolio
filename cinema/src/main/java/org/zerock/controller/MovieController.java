package org.zerock.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		
		@RequestMapping(value="detail.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
		@ResponseBody
		public String showDetail(@RequestParam(value = "link") String link) //@RequestParam("가져올 데이터의 이름") [데이터타입] [가져온데이터를 담을 변수]
		{
			
			System.out.println("도착한 url :" + link);
			
			String url = link;
			Document doc = null;
			
			try {
				doc = Jsoup.connect(url).get();
				Elements elements = doc.select(".score_reple");
				//Iterator<Element> nick = elements.select("a.color_b").iterator();
				//Iterator<Element> scores = elements.select("div.list_netizen_score").iterator();
				Iterator<Element> reviews = elements.select("p").iterator();
				
				Pattern pat;
				Matcher mat;
				
				int i = 0;
				
				while(i < 1)
				{
					//String title = titles.next().text();
					//String score = scores.next().text();
					String review = reviews.next().text();
					
					//review = review.substring(0, review.length()-3);
					pat = Pattern.compile("별점 - 총 10 점 중[0-9]{1,2} ");
					
					mat = pat.matcher(review);
					review = mat.replaceAll("").trim();
					
					System.out.println("------------------------");
					//System.out.println("영화제목 : " + title);
					//System.out.println("평점 : " + score);
					System.out.println("리뷰 : " + review);
					i++;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return link;
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
