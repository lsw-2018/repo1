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
		//��ѯ��Ʒ//isTuijian����Ʒ     isHot������   isGood�Ǿ�Ʒ
		List<Goods> isnews = is.findAllNew();
		map.put("isnews", isnews);
		
		//��ѯ��Ʒ
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
		 * �߼�Ϊ�����������빺�ﳵ��ť�����жϵ�ǰ�û��Ƿ��¼
		 * ����Ѿ���¼�����빺�ﳵ���idӦΪ�Ѿ���¼�ߵ�id
		 * ���û�е�¼�������cookie (û����cookie ��ʱ����¼)
		 */
		User user = (User)session.getAttribute("loginuser");
		
		if(user!=null) {
			//���user���ǿգ�˵���Ѿ���¼����ֱ�����ﳵ���в��뼴��
			cs.insert(new Charts(0,goodsid,num,user.getId()));
			//����ǰ̨������Ϊ��ǰ�û��� ���й��ﳵ���������
			return cs.getChartsNumByUid(user.getId())+"";
		}else {
			//�������δ��¼�û�
			//��ʱ�����������1.δ��¼����һ�μӹ��ﳵ
			//                2.δ��¼���Ѿ��ӹ����ﳵ
			
			//Cookie c = new Cookie("one","chart");
//			User tempuser = (User)session.getAttribute("tempuser");
//			if(tempuser==null) {//���Ϊ��˵����һ�μӹ��ﳵ
//		    	tempuser = us.insertTempUser();//�½�һ���û�����Ϊ��ʱ�û�
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
 		//�޸Ĺ��ﳵ ����
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
		  //ȡ���û��� �Ӷ�ȡ����ַ
		  User loginuser=(User)session.getAttribute("loginuser");
		  List<Address> adds =  null;
		  if(loginuser!=null)
			  adds = as.getAddrByUid(loginuser.getId());
		  model.addAttribute("addrs", adds);
 		return "ok";
 	}
}
