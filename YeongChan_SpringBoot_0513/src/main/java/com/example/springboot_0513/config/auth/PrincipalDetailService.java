package com.example.springboot_0513.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.springboot_0513.model.Member;
import com.example.springboot_0513.repository.MemberRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{
	@Autowired
	private MemberRepository memberRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memberRepository.findByUsername(username);
		
		if(member == null) return null;
		PrincipalDetails pmember = new PrincipalDetails(member);
		//System.out.println("pmember : "+ pmember);
		return pmember;
	}

}
