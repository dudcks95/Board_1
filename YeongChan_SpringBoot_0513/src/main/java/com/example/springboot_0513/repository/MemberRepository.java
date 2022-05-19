package com.example.springboot_0513.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.springboot_0513.model.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	Member findByUsername(String username); // 쿼리메소드
}
