package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Service;

import com.dl.mapper.ChartsMapper;
import com.dl.mapper.GoodsMapper;
import com.dl.pojo.Charts;
import com.dl.pojo.ChartsExample;
import com.dl.pojo.ChartsExample.Criteria;

@Service
public class ChartsService {

	@Resource
	private ChartsMapper cm;
	@Resource
	private GoodsMapper gm;
	
	public void insert(Charts charts) {
    cm.insert(charts);		
	}
	public List<Charts> findAll() {
		return cm.selectByExample(new ChartsExample());
	}
	public List<Charts> findByUID(int uid) {
		ChartsExample ce = new ChartsExample();
		Criteria c = ce.createCriteria();
		c.andUidEqualTo(uid);
		List<Charts> charts = cm.selectByExample(ce);
		for(Charts ch:charts) {
			ch.setGoods(gm.selectByPrimaryKey(ch.getGid()));
		}
		return charts;
	}
	public int getChartsNumByUid(int uid) {
		List<Charts> charts = findByUID(uid);
		//
		int sum=0;
		for(Charts c:charts) {
			sum+=c.getNum();
		}
		return sum;
	}
	public void delete(int id) {
		cm.deleteByPrimaryKey(id);
	}
	
	
	public void deleteByIds(String newids) {
	   cm.deleteByIds(newids);
		
	}
	public void updateNumById(Charts c) {
		cm.updateNumById(c);
	}

}
