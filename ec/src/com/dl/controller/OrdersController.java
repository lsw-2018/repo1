package com.dl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dl.pojo.Goods;
import com.dl.pojo.Orders;
import com.dl.pojo.User;
import com.dl.service.OrdersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("orders")

public class OrdersController {

	@Resource
	private OrdersService os;
	private int size=6;
	
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Orders> pageInfo = new PageInfo<>(os.findAll());
		map.put("pageInfo", pageInfo);
		map.put("url","/orders/findAll.action");
		return "../back/orders_list";
	}
	@RequestMapping("delete")
	public String delete(int id) {
		os.delete(id);
		return "redirect:findAll.action";
	}

	/*
	 * @RequestMapping("findById") public String findById(int id,Map<String,Orders>
	 * map) { Orders g = os.findById(id); map.put("updateorders", g); return
	 * "../orders_update"; }
	 */
	@RequestMapping("update")
	public String update(int id,String status) {
		 Orders g = os.findById(id);
	     g.setStatus(status);
		os.update(g);
		return "redirect:findAll.action";
	}
	@RequestMapping("findByName")
	public String findByName(String username,Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Orders> pageInfo = new PageInfo<>(os.findByName(username));
		map.put("pageInfo", pageInfo);
		map.put("url","/orders/findByName.action?username="+username);
		
		return "../back/orders_list";
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
			os.deleteSome(s);
		}
		return s.size()+"";
	}
	
	@RequestMapping("insert")
	public String insert(Orders orders) {
		os.insert(orders);
		return "redirect:findAll.action";
	}
	
	@RequestMapping("export")
	@ResponseBody
	public JSONArray export(){
		List<Orders> los =os.findAll();
		return JSONArray.fromObject(los);
	}
	
}
