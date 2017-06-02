package today.muay.program.service.impl;

import java.util.Map;

import today.muay.program.dao.StadiumDao;
import today.muay.program.service.StadiumService;

public class StadiumServiceImpl implements StadiumService {
	private StadiumDao stadiumDao;

	public void setStadiumDao(StadiumDao stadiumDao) {
		this.stadiumDao = stadiumDao;
	}

	public int insertStadium(String sname) {
		return stadiumDao.insert(sname);
	}

	public Number updateStadium(Map params) {
		return stadiumDao.update(params);
	}
}