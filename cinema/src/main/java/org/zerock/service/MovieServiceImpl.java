package org.zerock.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;

import java.net.HttpURLConnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;

import java.net.HttpURLConnection;

@Service
public class MovieServiceImpl {
	
	private MovieVO movievo;
	
	public String findkeyword(String keyword)
	{
		String clientId = "DCJ09aiyajA2FDSBr92m";
		String clientSecret = "HywUosgpWN";
		String text = null;
		
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
		}catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}
		
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		
		return responseBody;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			}else {
				return readBody(con.getErrorStream());
			}
		}catch(IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		}finally {
			con.disconnect();
		}
	}
	
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		}catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다" + apiUrl, e);
		}catch(IOException e) {
			throw new RuntimeException("연결이 실패했습니다. " + apiUrl, e);
		}
	}
	
	private static String readBody(InputStream body)
	{
		InputStreamReader streamReader = new InputStreamReader(body);
		
		
		try(BufferedReader lineReader = new BufferedReader(streamReader)){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
					
		}catch(IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패함", e);
		}
	}
	
	
	public String Result(String keyword)
	{
		StringBuffer result = new StringBuffer();
		String clientId = "DCJ09aiyajA2FDSBr92m";
		String clientSecret = "HywUosgpWN";
		String text = null;
		
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
			
			
			String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;
			
			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", clientId);
			requestHeaders.put("X-Naver-Client-Secret", clientSecret);
			String responseBody = get(apiURL, requestHeaders);
			
			URL url = new URL(responseBody.toString());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader rd;
			
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line;
			while((line = rd.readLine()) != null) {
				result.append(line + "\n");
			}
			rd.close();
			conn.disconnect();
		}catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return result + "";
	}
	
}
