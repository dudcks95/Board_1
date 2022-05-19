package com.example.springboot_0513.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.springboot_0513.model.Member;
import com.example.springboot_0513.repository.MemberRepository;

@Transactional(readOnly=true)
@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;
	public void join(Member member) {
		String rawPassword = member.getPassword();
		String encPassword = encoder.encode(rawPassword);
		member.setPassword(encPassword); //암호화된 password
		memberRepository.save(member);
	}
	
//	public List<Member> list() {
//		return memberRepository.findAll();
//	}
	
	public Page<Member> findAll(Pageable pageable){
		return memberRepository.findAll(pageable);
	}
	
	public Long count() {
		return memberRepository.count();
	}
	
	@Transactional
	public void delete(Long id) {
		memberRepository.deleteById(id);
	}
	@Transactional
	public Member findById(Long id) {
		Member member = memberRepository.findById(id).get();
		return member;
	}
	
	@Transactional
	public void update(Member member) {
		Member mem = memberRepository.findById(member.getId()).get();
		mem.setPassword(member.getPassword());
		mem.setEmail(member.getEmail());

	}
}
