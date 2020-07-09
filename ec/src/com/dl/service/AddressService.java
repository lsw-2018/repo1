package com.dl.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dl.mapper.AddressMapper;
import com.dl.pojo.Address;
import com.dl.pojo.AddressExample;
import com.dl.pojo.AddressExample.Criteria;

@Service
public class AddressService {
   @Resource
   private AddressMapper am;

public List<Address> getAddrByUid(Integer id) {
	AddressExample ae = new AddressExample();
	Criteria c = ae.createCriteria();
	c.andUidEqualTo(id);
	return am.selectByExample(ae);
}
   
   
}
