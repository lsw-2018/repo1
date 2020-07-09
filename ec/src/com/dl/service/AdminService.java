package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.AdminMapper;
import com.dl.pojo.Admin;
import com.dl.pojo.AdminExample;
import com.dl.pojo.AdminExample.Criteria;

@Service
public class AdminService {

	@Resource
	private  AdminMapper am;
	
	public Admin login(Admin admin) {
		AdminExample ae = new AdminExample();
		Criteria c = ae.createCriteria();
		c.andUsernameEqualTo(admin.getUsername()).andPasswordEqualTo(admin.getPassword());
		List<Admin> ads = am.selectByExample(ae);
		return ads.size()>0?ads.get(0):null;
	}

	public void update(Admin ad) {
		am.updateByPrimaryKey(ad);
	}
}
