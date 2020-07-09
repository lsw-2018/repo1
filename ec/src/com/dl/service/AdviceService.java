package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.AdviceMapper;
import com.dl.pojo.Advice;
import com.dl.pojo.AdviceExample;
import com.dl.pojo.AdviceExample.Criteria;

@Service
public class AdviceService {
	@Resource
	private AdviceMapper am;
	
	public List<Advice> findAll() {
		return am.selectByExample(new AdviceExample());
	}

	public void delete(int id) {
		am.deleteByPrimaryKey(id);
	}

	public Advice findById(int id) {
		return am.selectByPrimaryKey(id);
	}

	public void update(Advice Advice) {
		am.updateByPrimaryKey(Advice);
	}

	public List<Advice> findByName(String Advicename) {
		AdviceExample ue = new AdviceExample();
		Criteria c = ue.createCriteria();
		c.andTitleLike("%"+Advicename+"%");
		return am.selectByExample(ue);
	}

	public void deleteSome(List<Integer> ids) {
		AdviceExample ue = new AdviceExample();
		Criteria c = ue.createCriteria();
		c.andIdIn(ids);
		am.deleteByExample(ue);
		
	}

	public List<Advice> findByPage(Integer page, int size) {
		page=(page-1)*size;
		return am.findByPage(page, size);
	}

	public int getCount() {
		return am.getCount();
	}

	public List<Advice> findByNamePage(String Advicename, int cpage, int size) {
		cpage=(cpage-1)*size;
		return am.findByNamePage(Advicename,cpage,size);
	}

	public int getNameCount(String Advicename) {
		 return am.getNameCount(Advicename);
	}

	public void insert(Advice advice) {
		am.insert(advice);
	}

}
