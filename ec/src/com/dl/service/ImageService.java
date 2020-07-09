package com.dl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.ImageMapper;
import com.dl.pojo.Image;
import com.dl.pojo.ImageExample;
import com.dl.pojo.ImageExample.Criteria;

@Service
public class ImageService {

	@Resource
	private ImageMapper im;
	
	public List<Image> findAll() {
		return im.selectByExample(new ImageExample());
	}

	public void delete(int id) {
		im.deleteByPrimaryKey(id);
	}

	public Image findById(int id) {
		return im.selectByPrimaryKey(id);
	}

	public void update(Image image) {
		im.updateByPrimaryKey(image);
	}

	public List<Image> findByName(String imagename) {
		ImageExample ie = new ImageExample();
		Criteria c = ie.createCriteria();
		c.andLocLike(imagename);
		return im.selectByExample(ie);
	}

	public void deleteSome(List<Integer> ids) {
		ImageExample ie = new ImageExample();
		Criteria c = ie.createCriteria();
		c.andIdIn(ids);
		im.deleteByExample(ie);
		
	}


	public void insert(Image image) {
	im.insert(image);
		
	}

}
