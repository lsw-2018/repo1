package com.dl.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dl.pojo.Admin;
import com.dl.service.AdminService;

@Controller
@SessionAttributes("manager")
@RequestMapping("admin")
public class AdminController {
@Resource
private AdminService as;
	
	@RequestMapping("login")
	public String login(Admin admin,Map<String,Admin> map) {
		//admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
		Admin manager = as.login(admin);
		if(manager!=null) {
			map.put("manager", manager);
			return "../back/backmain";
		}
		return "../back/backlogin";
	}
	
	@RequestMapping("update")
	public String update(Admin admin,HttpServletRequest res) {
		Admin ad = (Admin)res.getSession().getAttribute("manager");
		ad.setUsername(admin.getUsername());
		ad.setPassword(admin.getPassword());
		as.update(ad);
	   res.getSession().setAttribute("manager", ad);
	   return "../back/backmain";
	}
	
	@RequestMapping("signout")
	public String signout(HttpServletRequest res) {
		res.getSession().setAttribute("manager", null);
		return "../back/backlogin";
	}
}
