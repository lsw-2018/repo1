package com.dl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.UserMapper;
import com.dl.pojo.Admin;
import com.dl.pojo.AdminExample;
import com.dl.pojo.User;
import com.dl.pojo.UserExample;
import com.dl.pojo.UserExample.Criteria;
import com.github.pagehelper.PageHelper;

@Service
public class UserService {

	@Resource
	private UserMapper um;
	
	public List<User> findAll() {
		return um.selectByExample(new UserExample());
	}

	public void delete(int id) {
		um.deleteByPrimaryKey(id);
	}

	public User findById(int id) {
		return um.selectByPrimaryKey(id);
	}

	public void update(User user) {
		um.updateByPrimaryKey(user);
	}

	public List<User> findByName(String username) {
		UserExample ue = new UserExample();
		Criteria c = ue.createCriteria();
		c.andUsernameLike("%"+username+"%");
		return um.selectByExample(ue);
	}

	public void deleteSome(List<Integer> ids) {
		UserExample ue = new UserExample();
		Criteria c = ue.createCriteria();
		c.andIdIn(ids);
		um.deleteByExample(ue);
		
	}

	public List<String> findLevels() {
		return um.findLevels();
	}

	public int findCountByType(String type) {
		return um.findCountByType(type);
	}

	public User insertTempUser() {
		//正常设计时id应为类似UUID的字符串，我们练习时设计成int自动递增了，在此模拟一下
		int uid=9000000+(int)(Math.random()*(999999-100000+1)+100000);
		User u = new User();
		u.setId(uid);
		um.insert(u);
		return u;
	}

	public User login(User user) {
		UserExample ae = new UserExample();
		Criteria c = ae.createCriteria();
		c.andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
		List<User> ads = um.selectByExample(ae);
		return ads.size()>0?ads.get(0):null;
	}



}
