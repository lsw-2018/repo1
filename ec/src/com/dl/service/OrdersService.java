package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.OrdersMapper;
import com.dl.pojo.Orders;
import com.dl.pojo.OrdersExample;
import com.dl.pojo.OrdersExample.Criteria;

@Service
public class OrdersService {

	@Resource
	private OrdersMapper om;
	
	public List<Orders> findAll() {
		return om.findAll();
	}

	public void delete(int id) {
		om.deleteByPrimaryKey(id);
	}

	public Orders findById(int id) {
		return om.selectByPrimaryKey(id);
	}

	public void update(Orders orders) {
		om.updateByPrimaryKey(orders);
	}

	public List<Orders> findByName(String name) {
		return om.findByName(name);
	}

	public void deleteSome(List<Integer> ids) {
		OrdersExample oe = new OrdersExample();
		Criteria c = oe.createCriteria();
		c.andIdIn(ids);
		om.deleteByExample(oe);
		
	}


//	public List<Orders> findByPage(Integer page, int size) {
//		page=(page-1)*size;
//		return om.findByPage(page, size);
//	}
//
//	public int getCount() {
//		return om.getCount();
//	}
//
//	public List<Orders> findByNamePage(String ordersname, int cpage, int size) {
//		cpage=(cpage-1)*size;
//		return om.findByNamePage(ordersname,cpage,size);
//	}
//
//	public int getNameCount(String ordersname) {
//		 return om.getNameCount(ordersname);
//	}

	public void insert(Orders orders) {
		om.insert(orders);
	}

}
