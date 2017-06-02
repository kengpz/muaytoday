package today.muay.program.service.impl;

import java.util.Map;

import today.muay.program.dao.ProgramDao;
import today.muay.program.service.ProgramService;

public class ProgramServiceImpl implements ProgramService {
	private ProgramDao programDao;

	public void setProgramDao(ProgramDao programDao) {
		this.programDao = programDao;
	}

	public int insert(Map params) {
		return programDao.insert(params);
	}

	public int delete(String programId) {
		return programDao.delete(Integer.parseInt(programId));
	}
}