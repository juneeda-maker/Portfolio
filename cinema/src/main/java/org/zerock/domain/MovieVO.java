package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MovieVO {
	
		public String title;
		public String link;
		public String image;
		public String subtitle;
		public Date pubDate;
		public String director;
		public String actor;
		public float userRating;
	
}
