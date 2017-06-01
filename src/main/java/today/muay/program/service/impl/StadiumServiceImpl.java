package today.muay.program.service.impl;

import java.util.Map;

import today.muay.program.dao.StadiumDao;
import today.muay.program.service.StadiumService;

public class StadiumServiceImpl implements StadiumService {
	private StadiumDao stadiumDao;

	public void setStadiumDao(StadiumDao stadiumDao) {
		this.stadiumDao = stadiumDao;
	}

	public Number insertStadium(String name) {
		return stadiumDao.insert(name);
	}

	public Number updateStadium(Map params) {
		return stadiumDao.update(params);
	}
}