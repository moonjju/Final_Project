package com.simpson.kisen.idol.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.dao.IdolDao;
import com.simpson.kisen.idol.model.vo.DipIdol;
import com.simpson.kisen.idol.model.vo.Idol;


@Service
public class IdolServiceImpl implements IdolService {
	
	@Autowired
	private IdolDao idolDao;

	@Override
	public List<Idol> selectAllIdole() {
		return idolDao.selectAllIdole();
	}

	@Override
	public int insertIdol(DipIdol dip) {
		return idolDao.insertIdol(dip);
	}

	@Override
	public int deleteidol(int idolNo) {
		return idolDao.deleteidol(idolNo);
	}

	@Override
	public List<DipIdol> selectOneCollection(String fanNo) {
		return idolDao.selectOneCollection(fanNo);
	}

	


	

}
