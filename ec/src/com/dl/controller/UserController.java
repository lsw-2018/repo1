package com.dl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dl.pojo.User;
import com.dl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("user")
@SessionAttributes("loginuser")
public class UserController {
     @Resource
	 private UserService us;
	 private int size=6;//每页显示数量
     
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<User> pageInfo = new PageInfo<>(us.findAll());
		map.put("pageInfo", pageInfo);
		map.put("url","/user/findAll.action");
		return "../back/user_list";
	}
	@RequestMapping("delete")
	public String delete(int id) {
		us.delete(id);
		return "redirect:findAll.action";
	}
	@RequestMapping("findById")
	public String findById(int id,Map<String,User> map) {
		User u = us.findById(id);
		map.put("updateuser", u);
		return "../back/user_update";
	}
	@RequestMapping("update")
	public String update(User user) {
		us.update(user);
		return "redirect:findAll.action";
	}
	@RequestMapping("findByName")
	public String findByName(String username,Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<User> pageInfo = new PageInfo<>(us.findByName(username));
		map.put("pageInfo", pageInfo);
		map.put("url","/user/findByName.action?username="+username);
		return "../back/user_list";
	}
	@RequestMapping("deleteSome")
	@ResponseBody
	public String deleteSome(String ids) {
		List<Integer> s =new ArrayList<>();
		if(!"".equals(ids)&&ids!=null) {
			String nids =ids.substring(0,ids.length()-1);
			List<String> is =Arrays.asList(nids.split(","));
			for(String i:is) {
				s.add(Integer.parseInt(i));
			}
			us.deleteSome(s);
		}
		return s.size()+"";
	}
	
	
	@RequestMapping("getLevels")
	@ResponseBody
	public JSONArray getLevels() {
		List<String> types = us.findLevels();
		return JSONArray.fromObject(types);
	}
	@RequestMapping("getNums")
	@ResponseBody
	public JSONArray getNums() {
		List<String> types = us.findLevels();
		List<Integer>  counts = new ArrayList<>();
		for(String t:types) {
			counts.add(us.findCountByType(t));
		}
		return JSONArray.fromObject(counts);
	}
	@RequestMapping("export")
	@ResponseBody
	public JSONArray export(){
		List<User> los =us.findAll();
		return JSONArray.fromObject(los);
	}
	
	@RequestMapping("login")
	public String login(User user,Model model) {
	User loginuser =us.login(user);
     if(loginuser==null) {
    	 return "../fore/reg";
     }else {
    	 model.addAttribute("loginuser", loginuser);
    	 return "redirect:../index/findAll.action";
     }
    	 
	}
}
