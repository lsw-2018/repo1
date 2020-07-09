package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.GoodsMapper;
import com.dl.mapper.ImageMapper;
import com.dl.pojo.Goods;
import com.dl.pojo.GoodsExample;
import com.dl.pojo.GoodsExample.Criteria;
import com.dl.pojo.Image;
import com.dl.pojo.ImageExample;

@Service
public class IndexService {

	@Resource
	private ImageMapper im;
	@Resource
	private GoodsMapper gm;
	
	
	public List<Image> findLunbo(){
		ImageExample ie = new ImageExample();
		ie.createCriteria().andTypeEqualTo("�ֲ�ͼ");
		return im.selectByExample(ie);
	}

	public List<Goods> findAllNew() {
		//isTuijian����Ʒ     isHot������   isGood�Ǿ�Ʒ
		GoodsExample ge = new GoodsExample();
		Criteria c = ge.createCriteria();
		c.andIstuijianEqualTo("��");
		return gm.selectByExample(ge);
	}

	public List<Goods> findAllGood() {
		GoodsExample ge = new GoodsExample();
		Criteria c = ge.createCriteria();
		c.andIsgoodEqualTo("��");
		return gm.selectByExample(ge);
	}

}
