package com.simpson.kisen.fan.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpson.kisen.fan.model.service.FanService;
import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.payment.model.service.PaymentService;
import com.simpson.kisen.payment.model.vo.Payment;
import com.simpson.kisen.unofficial.model.vo.UnofficialDemand;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mypage")
@SessionAttributes({"loginMember", "principal"})

public class MyPageController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	@Autowired
	private PaymentService paymentService;
	@Autowired
	private FanService fanService;
	
	@GetMapping("/mypagePay.do")
	public void mypage(Authentication authentication, Model model){
		
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
			List<Payment> payList = paymentService.selectAllList(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
			model.addAttribute("payList", payList);
			
			
			log.info("payList = {}", payList);
			log.info("authentication = {}", authentication);
			// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=?????????, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=????????? ?????????, hobby=[??????,  ??????], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
			log.info("principal = {}", principal);
		} catch (Exception e) {
			log.error("???????????? ???????????? ??????!", e);
			throw e;
		}
	}
	
	@GetMapping("/mypageform.do")
	public void mypageform(Authentication authentication, Model model){
		
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
			List<UnofficialDemand > udList = paymentService.selectUdList(principal.getFanNo());
			
			model.addAttribute("loginMember", principal);
			model.addAttribute("udList",udList );
			
			
			log.info("udList = {}", udList);
			log.info("authentication = {}", authentication);
			// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=?????????, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=????????? ?????????, hobby=[??????,  ??????], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
			log.info("principal = {}", principal);
		} catch (Exception e) {
			log.error("???????????? ???????????? ??????!", e);
			throw e;
		}
	}
	
	
		
	@GetMapping("/mypageMember.do")
	public void mypageMember(Authentication authentication, Model model){
		try {
			Fan principal = (Fan) authentication.getPrincipal();
			
			
			model.addAttribute("loginMember", principal);
			
			log.debug("authentication = {}", authentication);
			log.debug("principal = {}", principal);
		} catch (Exception e) {
			log.error("?????? ???????????? ??????!", e);
			throw e;
		}
	}
	
	@PostMapping("/updateMypage.do")
	public String updateMypgae (@ModelAttribute Fan updateFan, @RequestParam String addressExt1,
			@RequestParam String addressExt2, @RequestParam String addressExt3,Authentication oldAuthentication,
			RedirectAttributes redirectAttr,  @RequestParam String fanNo) {
		log.info("???????????? fan = {}", updateFan);
		try {
			String rawPassword = updateFan.getPassword();
			String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
			// member??? ???????????? ???????????? ?????? ??????
			updateFan.setPassword(encodedPassword);
			updateFan.setAddress(updateFan.getAddress() + "-" + addressExt1 + "-" + addressExt2 + "-" + addressExt3);
			updateFan.setFanNo(fanNo);	
			Collection<? extends GrantedAuthority> oldAuthorities = 
						oldAuthentication.getAuthorities();
			
			List<SimpleGrantedAuthority> authorities = new ArrayList<>();
			for(GrantedAuthority auth : oldAuthorities) {
					SimpleGrantedAuthority simpleAuth = 
						new SimpleGrantedAuthority(auth.getAuthority());
		      // ???????????? ????????? auth???????????? 
					authorities.add(simpleAuth);
				}
			
			updateFan.setAuthorities(authorities);
			
			log.info("???????????? -fan = {}", updateFan);
			int result = fanService.updateFan(updateFan);
				
				//????????? authentication?????? ??????
				Authentication newAuthentication = 
						new UsernamePasswordAuthenticationToken(
								updateFan,
								oldAuthentication.getCredentials(),
								oldAuthentication.getAuthorities()
								);
				log.info("???????????? -Authentication = {}", newAuthentication);
				//SecurityContextHolder - SecurityContext ????????? ??????
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		} catch(Exception e) {
			log.error("?????? ?????? ?????? ??????!", e);
			throw e;
		}
		return "redirect:/mypage/mypageMember.do";
		
	}
	
	@PostMapping("/deleteFan.do")
	public String deleteFan(@RequestParam String fanId, RedirectAttributes redirectAttr) {
		try {
		
			log.info("fanId={}",fanId);
		
			//1. ????????????
			int result = fanService.deleteFan(fanId);
		
	//2. ?????????????????? 
			redirectAttr.addFlashAttribute("msg", "?????? ?????? ??????!");
		} catch(Exception e) {
			log.error("?????? ?????? ??????!", e);
			throw e;
		}
		return "redirect:/member/logout.do";
	}
	
	
}
