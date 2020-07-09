package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.GoodsMapper;
import com.dl.pojo.Goods;
import com.dl.pojo.GoodsExample;
import com.dl.pojo.GoodsExample.Criteria;

@Service
public class GoodsService {

	@Resource
	private GoodsMapper gm;
	
	public List<Goods> findAll() {
		return gm.selectByExample(new GoodsExample());
	}

	public void delete(int id) {
		gm.deleteByPrimaryKey(id);
	}

	public Goods findById(int id) {
		return gm.selectByPrimaryKey(id);
	}

	public void update(Goods Goods) {
		gm.updateByPrimaryKeyWithBLOBs(Goods);
	}

	public List<Goods> findByName(String name) {
		GoodsExample ue = new GoodsExample();
		Criteria c = ue.createCriteria();
		c.andNameLike("%"+name+"%");
		return gm.selectByExample(ue);
	}

	public void deleteSome(List<Integer> ids) {
		GoodsExample ue = new GoodsExample();
		Criteria c = ue.createCriteria();
		c.andIdIn(ids);
		gm.deleteByExample(ue);
		
	}



	public void insert(Goods goods) {
		gm.insert(goods);
	}

	public List<String> getTypes() {
		return  gm.getTypes();
	}

	public Integer getSaleByType(String t) {
		return gm.getSaleByType(t);
	}

}
