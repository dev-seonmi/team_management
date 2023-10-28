package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.model.TeamDTO;
import com.model.TeamMapper;
import com.utility.Utility;

@Controller
public class TeamController {
	
	@Autowired
	private TeamMapper mapper;
	
	@GetMapping("/")
	public String home() {
		
		return "/home";
	}
	
	@GetMapping("/team/list")
	public String list(HttpServletRequest request,Model model) {
		//검색관련
		String col = Utility.chechNull(request.getParameter("col")) ; 
		String word = Utility.chechNull(request.getParameter("word"));
		
		if(col.equals("total")) word = "";
		
		//페이징관련
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		//한페이지당 보여줄 레코드 갯수
		int eno = 5;
		//데이터베이스에서 시작 레코드 수
		int sno = (nowPage-1) * eno;
		
		//데이터베이스에서 목록 가져오기
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<TeamDTO> list = mapper.list(map);
		
		int total = mapper.total(map);
		
		String url = "list";
		
		String paging = Utility.paging(total, nowPage, eno, col, word, url);		
		
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);		
		
		return "/list";
	}
	
	@GetMapping("/team/read")
	public String read(int teamno, Model model) {
		//조회
		TeamDTO dto = mapper.read(teamno);

		model.addAttribute("dto", dto);

		return "/read";
	}
	
	@GetMapping("/team/create")
	public String create() {
		
		return "/create";
	}
	
	@PostMapping("/team/create")
	public String create(TeamDTO dto) {
		
		int cnt = mapper.create(dto);
		
		if(cnt>0) {
			return "redirect:/team/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/team/update")
	public String update(int teamno,Model model) {
		
		
		model.addAttribute("dto", mapper.read(teamno));
		
		return "/update";
	}
	
	@PostMapping("/team/update")
	public String update(TeamDTO dto) {

		int cnt = mapper.update(dto);
		
		if(cnt==0) {
			return "error";
		}else {		
			return "redirect:/team/list";
		}
	}
	

	@GetMapping("/team/delete")
	public String delete() {
		
		return "/delete";
	}
	
	@PostMapping("/team/delete")
	public String delete(int teamno, String passwd) {
		int pflag = passwd.equals("delete") ? 1 : 0;
		int cnt =0;
		if(pflag>0) {
			cnt = mapper.delete(teamno);
		}	
		
		if(pflag==0) {
			return "passwdError";
		}else if(cnt==0) {
			return "error";
		}else {		
			return "redirect:/team/list";
		}
	}
	

}
