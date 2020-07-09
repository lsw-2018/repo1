package com.dl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dl.pojo.Goods;
import com.dl.pojo.User;
import com.dl.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("goods")

public class GoodsController {

	@Resource
	private GoodsService gs;
	private int size=5;
	
	
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Goods> pageInfo = new PageInfo<>(gs.findAll());
		map.put("pageInfo", pageInfo);
		map.put("url","/goods/findAll.action");
		return "../back/goods_list";
	}
	@RequestMapping("delete")
	public String delete(int id) {
		gs.delete(id);
		return "redirect:findAll.action";
	}
	@RequestMapping("findById")
	public String findById(int id,Map<String,Goods> map) {
		Goods g = gs.findById(id);
		map.put("updategoods", g);
		return "../back/goods_update";
	}
	@RequestMapping("update")
	public String update(Goods goods,MultipartFile upimg,String updatefile) {
		if("".equals(upimg.getOriginalFilename()))
		    goods.setPic(updatefile);
		else
		  goods.setPic(upload(upimg));
		gs.update(goods);
		return "redirect:findAll.action";
	}
	@RequestMapping("findByName")
	public String findByName(String username,Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Goods> pageInfo = new PageInfo<>(gs.findByName(username));
		map.put("pageInfo", pageInfo);
		map.put("url","/goods/findByName.action?username="+username);
		return "../back/goods_list";
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
			gs.deleteSome(s);
		}
		return s.size()+"";
	}
	
	@RequestMapping("insert")
	public String insert(Goods goods,MultipartFile upimg) {
	   goods.setPic(upload(upimg));
	   goods.setColor(goods.getColor().replaceAll(",", "|"));
		gs.insert(goods);
		
		return "redirect:findAll.action";
	}
	
	public String upload(MultipartFile upimg) {
		String filename=upimg.getOriginalFilename();
		String newname="";
		if(!"".equals(filename)&&filename!=null) {
			String suffix = filename.substring(filename.lastIndexOf("."));
			newname=UUID.randomUUID()+suffix;
			File f = new File("d://ele//imgs//"+newname);
			try {
				upimg.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return newname;
	}
	
	@RequestMapping("getTypes")
	@ResponseBody
	public JSONArray getTypes() {
		List<String> list = gs.getTypes();
		return JSONArray.fromObject(list);
	}
	@RequestMapping("getSales")
	@ResponseBody
	public JSONArray getSales() {
		List<String> types = gs.getTypes();
		List<Integer>  sales = new ArrayList<>();
		for(String t:types) {
			sales.add(gs.getSaleByType(t));
		}
		return JSONArray.fromObject(sales);
	}
	@RequestMapping("export")
	@ResponseBody
	public JSONArray export(){
		List<Goods> los =gs.findAll();
		return JSONArray.fromObject(los);
	}
}
