package com.dl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dl.pojo.Admin;
import com.dl.pojo.Advice;
import com.dl.pojo.Goods;
import com.dl.service.AdviceService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("advice")
public class AdviceController {
     @Resource
	 private AdviceService as;
     private int size=8;
	
     @RequestMapping("insert")
     public String insert(Advice advice,HttpServletRequest request) {
    	 advice.setTime(new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss").format(new Date()));
    	 advice.setAid(((Admin)request.getSession().getAttribute("manager")).getId());
    	 as.insert(advice);
    	 return "redirect:findAll.action";
     }
     
     
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Advice> pageInfo = new PageInfo<>(as.findAll());
		map.put("pageInfo", pageInfo);
		map.put("url","/advice/findAll.action");
		return "../back/advice_list";
	}
	@RequestMapping("delete")
	public String delete(int id) {
		as.delete(id);
		return "redirect:findAll.action";
	}
	@RequestMapping("findById")
	public String findById(int id,Map<String,Advice> map) {
		Advice u = as.findById(id);
		map.put("updateadvice", u);
		return "../back/advice_update";
	}
	@RequestMapping("update")
	public String update(Advice advice,HttpServletRequest request) {
		 advice.setTime(new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss").format(new Date()));
    	 advice.setAid(((Admin)request.getSession().getAttribute("manager")).getId());
		as.update(advice);
		return "redirect:findAll.action";
	}
	@RequestMapping("findByName")
	public String findByName(String username,Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Advice> pageInfo = new PageInfo<>(as.findByName(username));
		map.put("pageInfo", pageInfo);
		map.put("url","/advice/findByName.action?username="+username);
		return "../back/advice_list";
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
			as.deleteSome(s);
		}
		return s.size()+"";
	}
}
