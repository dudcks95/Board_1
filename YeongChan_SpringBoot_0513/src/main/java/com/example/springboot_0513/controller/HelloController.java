package com.example.springboot_0513.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.springboot_0513.model.Member;
import com.example.springboot_0513.service.MemberService;

@Controller
public class HelloController {
	@Autowired
	private MemberService memberService;

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("join")
	public String join() {
		return "/member/join";
	}
	
	@PostMapping("/join")
	@ResponseBody
	public String join(@RequestBody Member member) {
		memberService.join(member);
		return "success";
	}
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	//로그인 에러
	@PostMapping("/login/error")
	public String login(Model model) {
		model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		return "/member/login";
	}
	
	@GetMapping("memberList")
	public String mlist(Model model, @PageableDefault(size=3, sort="id",
			direction = Direction.DESC) Pageable pageable) {
		Page<Member> lists = memberService.findAll(pageable);
		model.addAttribute("members", lists);
		model.addAttribute("count", memberService.count());
		return "/member/memberList";
	}
	
	@GetMapping("memberView/{id}")
	public String memberView(@PathVariable Long id, Model model) {
		model.addAttribute("member", memberService.findById(id));
		return "/member/memberView";
	}
	
	@GetMapping("memberUpdate/{id}")
	public String memberUpdate(@PathVariable Long id, Model model) {
		model.addAttribute("member", memberService.findById(id));
		return "/member/memberUpdate";
	}
	
	@PutMapping("memberUpdate")
	@ResponseBody
	public String update(@RequestBody Member member) {
		memberService.update(member);
		return "success";
	}
	
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		memberService.delete(id);
		return "success";
	}
}
