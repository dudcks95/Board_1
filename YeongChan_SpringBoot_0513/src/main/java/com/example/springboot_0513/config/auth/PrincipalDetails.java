package com.example.springboot_0513.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.springboot_0513.model.Member;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails{
	private Member member;
	
	public PrincipalDetails(Member member) {
		this.member = member;
	}

	//해당 유저의 권한 목록
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		//if (member.getRole().equals("관리자")) { 
		collect.add(()->{
			return member.getRole();
		});
		//}
		return collect;
	}

	@Override
	public String getPassword() {
		return member.getPassword();
	}

	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return member.getUsername();
	}
	
	/**
     * 계정 만료 여부
     * true : 만료 안됨
     * false : 만료
     * @return
     */
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	/**
     * 계정 잠김 여부
     * true : 잠기지 않음
     * false : 잠김
     * @return
     */
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	/**
     * 비밀번호 만료 여부
     * true : 만료 안됨
     * false : 만료
     * @return
     */
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	 /**
     * 사용자 활성화 여부
     * ture : 활성화
     * false : 비활성화
     * @return
     */
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
