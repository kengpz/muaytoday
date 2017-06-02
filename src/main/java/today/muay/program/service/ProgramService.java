package today.muay.program.service;

import java.util.Map;

public interface ProgramService {
	public int insert(Map params);
	public int delete(String programId);
}