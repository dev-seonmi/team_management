package com.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class TeamDTO {
	int		teamno ; 
	String	tname  ; 
	String	skills ;
	String	phone  ; 
	String	address; 	
	int 	zipcode; 
    String	gender ; 
	String	rdate  ; 
}    

