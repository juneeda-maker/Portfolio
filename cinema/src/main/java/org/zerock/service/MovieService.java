package org.zerock.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class MovieService {

	public Object getItemsFromOpenApi(String movieNm, String targetDt) throws UnsupportedEncodingException {
        
        String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
        String key = "d303a23ab6c0bc90fee593ef8fe9e67a";
        String decodeServiceKey = URLDecoder.decode(key, "UTF-8");
        
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));    //Response Header to UTF-8  
        
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("key", decodeServiceKey)
                .queryParam("movieNm", movieNm)
                .queryParam("targetDt", targetDt)
                .build(false);    //자동으로 encode해주는 것을 막기 위해 false
        
        Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
        return response;
    }
}
