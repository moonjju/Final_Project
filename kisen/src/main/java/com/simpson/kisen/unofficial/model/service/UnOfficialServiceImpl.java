package com.simpson.kisen.unofficial.model.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simpson.kisen.fan.model.vo.Fan;
import com.simpson.kisen.idol.model.vo.Idol;
import com.simpson.kisen.product.model.vo.ProductImg;
import com.simpson.kisen.product.model.vo.ProductImgExt;
import com.simpson.kisen.product.model.vo.ProductOption;
import com.simpson.kisen.unofficial.model.dao.UnOfficialDao;
import com.simpson.kisen.unofficial.model.vo.DemandpdImg;
import com.simpson.kisen.unofficial.model.vo.DepositpdImg;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt;
import com.simpson.kisen.unofficial.model.vo.UnofficialPdImgExt2;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UnOfficialServiceImpl implements UnOfficialService {
	
	@Autowired
	private UnOfficialDao unofficialDao;

	@Override
	public int insertdemandEnroll(UnofficialPdImgExt unofficialdemand) {
		int result = 0;
		result = unofficialDao.insertdemandEnroll(unofficialdemand);
		
		if(unofficialdemand.getDemandpdImgList().size()>0) {
			for(DemandpdImg pdImg : unofficialdemand.getDemandpdImgList()) {
				pdImg.setDemandNo(unofficialdemand.getDemandNo());
				result = insertDemandpdImg(pdImg);
			}
		}
		return result;
	}


	@Override
	public int insertdepositEnroll(UnofficialPdImgExt2 unofficialdeposit) {
		int result = 0;
		result = unofficialDao.insertdepositEnroll(unofficialdeposit);
		
		if(unofficialdeposit.getDepositpdImgList().size()>0) {
			for(DepositpdImg pdImg : unofficialdeposit.getDepositpdImgList()) {
				log.info("unofficialdeposit@service ={}",unofficialdeposit.getDno());
				pdImg.setDNo(unofficialdeposit.getDno());
				result = insertDepositpdImg(pdImg);
			}
		}
		return result;
	}

	


	@Transactional(rollbackFor = Exception.class)
	public int insertDemandpdImg(DemandpdImg productImg) {
		return unofficialDao.insertDemandpdImg(productImg);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertDepositpdImg(DepositpdImg productImg) {
		return unofficialDao.insertDepositpdImg(productImg);
	}


	@Override
	public List<UnofficialPdImgExt> selectunofficialdemandList() {
		return unofficialDao.selectunofficialdemandList();
	}


	@Override
	public UnofficialPdImgExt selectunofficialdemand(String demandNo) {
		return unofficialDao.selectunofficialdemand(demandNo);
	}


	@Override
	public List<UnofficialPdImgExt2> selectunofficialdepositList() {
		return unofficialDao.selectunofficialdeposit();
	}


	@Override
	public UnofficialPdImgExt2 selectunofficialdeposit(String dno) {
		return unofficialDao.selectunofficialdeposit(dno);
	}


	@Override
	public UnofficialPdImgExt selectOneDemand(String demandNo) {
		return unofficialDao.selectOneDemand(demandNo);
	}

	@Override
	public int deletedemand(String delNo) {
		return unofficialDao.deletedemand(delNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateDemand(UnofficialPdImgExt unofficialdemand) {
		int result =0;
		
		result = unofficialDao.updateDemand(unofficialdemand);
		if(unofficialdemand.getDemandpdImgList().size()>0) {
			for(DemandpdImg pdImg : unofficialdemand.getDemandpdImgList()) {
				pdImg.setDemandNo(unofficialdemand.getDemandNo());
				result = updateDemandImg(pdImg);
			}
		}		
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updateDemandImg(DemandpdImg pdImg) {
		return unofficialDao.updateDemandImg(pdImg);
	}


	@Override
	public int updateStock(Map<String, Object> map) {
		return unofficialDao.updateStock(map);
	}


	@Override
	public Fan selectOneMemberByEmail(String email) {
		return unofficialDao.selectOneMemberByEmail(email);
	}


	


	

	

	
	





	

}
