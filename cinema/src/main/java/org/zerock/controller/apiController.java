package org.zerock.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/*", produces = "application/json;charset=utf-8")
public class apiController {
	
	@GetMapping("/list")
	public String getmovieList()
	{
		StringBuffer result = new StringBuffer();
		try {
				String urlstr = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=d303a23ab6c0bc90fee593ef8fe9e67a&targetDt=20120101";
			
				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				
				BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
				
				String returnLine;
				
				while((returnLine = br.readLine()) != null)
				{
					result.append(returnLine + "\n");
				}
				urlconnection.disconnect();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return result + "</xmp>";
	}
}
