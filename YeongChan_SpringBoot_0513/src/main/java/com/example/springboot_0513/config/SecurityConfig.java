package com.example.springboot_0513.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.springboot_0513.config.auth.UserFailHandler;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	private UserFailHandler userFailHandler;
	
	@Bean
	public BCryptPasswordEncoder encodePwd() { //비밀번호 암호화
		return new BCryptPasswordEncoder();
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeHttpRequests()
			.antMatchers("/").authenticated()
			.anyRequest()
			.permitAll()
		.and()
			.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/")
			.failureForwardUrl("/login/error")
		.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true);
	}
}
