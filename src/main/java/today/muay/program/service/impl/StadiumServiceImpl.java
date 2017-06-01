package today.muay.program.service.impl;

import java.util.Map;

import today.muay.program.dao.StadiumDao;

public class StadiumServiceImpl implements StadiumDao {
	private StadiumDao stadiumDao;

	public void setStadiumDao(StadiumDao stadiumDao) {
		this.stadiumDao = stadiumDao;
	}

	public Number insert(String name) {
		return stadiumDao.insert(name);
	}

	public Number update(Map params) {
		return stadiumDao.update(params);
	}

}