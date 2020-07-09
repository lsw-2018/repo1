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
import com.dl.pojo.Image;
import com.dl.service.ImageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("image")
public class ImageController {
     @Resource
	 private ImageService is;
	 private int size=5;
     
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map,Integer pageNo) {
		PageHelper.startPage(pageNo==null?1:pageNo, size);
		PageInfo<Image> pageInfo = new PageInfo<>(is.findAll());
		map.put("pageInfo", pageInfo);
		map.put("url","/image/findAll.action");
		return "../back/image_list";
	}
	@RequestMapping("delete")
	public String delete(int id) {
		is.delete(id);
		return "redirect:findAll.action";
	}
	@RequestMapping("findById")
	public String findById(int id,Map<String,Image> map) {
		Image i = is.findById(id);
		map.put("updateimage", i);
		return "../back/image_update";
	}
	@RequestMapping("update")
	public String update(Image image,MultipartFile upimg,String updatefile) {
		if("".equals(upimg.getOriginalFilename()))
			image.setLoc(updatefile);
		else
			image.setLoc(upload(upimg));
		
		is.update(image);
		return "redirect:findAll.action";
	}

	@RequestMapping("deleteSome")
	@ResponseBody
	public String deleteSome(String ids) {
		List<Integer> s =new ArrayList<>();
		if(!"".equals(ids)&&ids!=null) {
			String nids =ids.substring(0,ids.length()-1);
			List<String> imgs =Arrays.asList(nids.split(","));
			for(String i:imgs) {
				s.add(Integer.parseInt(i));
			}
			is.deleteSome(s);
		}
		return s.size()+"";
	}
	@RequestMapping("insert")
	public String insert(Image image,MultipartFile upimg) {
	   image.setLoc(upload(upimg));
		is.insert(image);
		return "redirect:findAll.action";
	}
	public String upload(MultipartFile upimg) {
		String filename=upimg.getOriginalFilename();
		String newname="";
		if(!"".equals(filename)&&filename!=null) {
			String suffix = filename.substring(filename.lastIndexOf("."));
			newname=UUID.randomUUID()+suffix;
			File f = new File("d://ele//lunbo//"+newname);
			try {
				upimg.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return newname;
	}
}
