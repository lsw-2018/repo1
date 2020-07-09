package com.dl.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dl.pojo.Address;
import com.dl.pojo.Charts;
import com.dl.pojo.Goods;
import com.dl.pojo.Image;
import com.dl.pojo.User;
import com.dl.service.AddressService;
import com.dl.service.ChartsService;
import com.dl.service.GoodsService;
import com.dl.service.IndexService;
import com.dl.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("index")
@SessionAttributes({"tempuser"})
public class IndexController {
    
	@Resource
	private IndexService is;
	@Resource
	private GoodsService gs;
	@Resource
	private ChartsService cs;
	@Resource
	private UserService us;
	@Resource
	private AddressService as;
	
	@ResponseBody
	@RequestMapping("findLunbo")
	public String findLunbo() {
		List<Image> imgs =is.findLunbo();
		JSONArray list = JSONArray.fromObject(imgs);
		return list.toString();
	}
	@RequestMapping("findAll")
	public String findAll(Map<String,Object> map) {
		//查询新品//isTuijian是新品     isHot是热销   isGood是精品
		List<Goods> isnews = is.findAllNew();
		map.put("isnews", isnews);
		
		//查询精品
		List<Goods> isgoods = is.findAllGood();
		map.put("isgoods", isgoods);
		return "../fore/index";
	}
	@RequestMapping("showone")
	public String showone(int id,Map<String,Object> map) {
		Goods g = gs.findById(id);
		
		String[] colors = g.getColor().split("|");
	    List<String> cls = new ArrayList<>();
		for(String c:colors) {
			if(!c.equals("|"))
			cls.add(c);
		}
		map.put("one", g);
		map.put("colors", cls);
		return "../fore/showone";
	}
	@RequestMapping("addchart")
	@ResponseBody
	public String addchart(int goodsid,String color,int num,Model  m,HttpSession session) {
		/*
		 * 逻辑为：当单击加入购物车按钮，先判断当前用户是否登录
		 * 如果已经登录，插入购物车表的id应为已经登录者的id
		 * 如果没有登录，则插入cookie (没讲过cookie 暂时都登录)
		 */
		User user = (User)session.getAttribute("loginuser");
		
		if(user!=null) {
			//如果user不是空，说明已经登录过，直接向购物车表中插入即可
			cs.insert(new Charts(0,goodsid,num,user.getId()));
			//返回前台的数量为当前用户下 所有购物车表的数量和
			return cs.getChartsNumByUid(user.getId())+"";
		}else {
			//否则就是未登录用户
			//此时分两种情况：1.未登录，第一次加购物车
			//                2.未登录，已经加过购物车
			
			//Cookie c = new Cookie("one","chart");
//			User tempuser = (User)session.getAttribute("tempuser");
//			if(tempuser==null) {//如果为空说明第一次加购物车
//		    	tempuser = us.insertTempUser();//新建一个用户，作为临时用户
//				session.setAttribute("tempuser", tempuser);
//			}
//			uid=tempuser.getId();
			return "fore/login.jsp";
		}
		
		
		
	}

	@RequestMapping("showchartnum")
	@ResponseBody
	public String showchartnum(HttpSession session) {
		User loginuser=(User)session.getAttribute("loginuser");
		User tempuser=(User)session.getAttribute("tempuser");
		int uid=0;
		if(loginuser!=null)
			uid=loginuser.getId();
		if(tempuser!=null)
			uid=tempuser.getId();
		
		return cs.getChartsNumByUid(uid)+"";
	}
	
	@RequestMapping("findcharts")
	public String findcharts(HttpSession session,Model model) {
		User loginuser=(User)session.getAttribute("loginuser");
		User tempuser=(User)session.getAttribute("tempuser");
		int uid=0;
		if(loginuser!=null) 
			uid=loginuser.getId();
		if(tempuser!=null)
			uid=tempuser.getId();
		List<Charts> charts = cs.findByUID(uid);
		model.addAttribute("charts", charts);
		return "../fore/charts";
	}
 	@RequestMapping("deletechart")
 	public String deletechart(int id) {
 		cs.delete(id);
 		return "redirect:findcharts.action";
 	}
 	@RequestMapping("batchDel")
 	@ResponseBody
 	public void deletechart(String ids) {
 		
 	   String newids = ids.substring(0,ids.length()-1);
 		cs.deleteByIds(newids);
 	}
 	@RequestMapping("confirmOrder")
 	@ResponseBody
 	public String confirmOrder(String charts,HttpSession session,Model model) {
 		//修改购物车 数量
 		JSONArray array=JSONArray.fromObject(charts);
        if(array!=null||array.size()!=0){ 
        	for(int i=0;i<array.size();i++){ 
        	   JSONObject jo = JSONObject.fromObject(array.get(i)); 
        	    Charts c = new Charts();
        	    c.setId(Integer.parseInt(jo.getString("id")));
        	    c.setNum(Integer.parseInt(jo.getString("num")));
        	    System.out.println(c);
        	    cs.updateNumById(c);    
        	  } 
        	}
		  //取得用户， 从而取到地址
		  User loginuser=(User)session.getAttribute("loginuser");
		  List<Address> adds =  null;
		  if(loginuser!=null)
			  adds = as.getAddrByUid(loginuser.getId());
		  model.addAttribute("addrs", adds);
 		return "ok";
 	}
}
