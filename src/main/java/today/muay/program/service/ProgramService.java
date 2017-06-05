package today.muay.program.service;

import java.util.List;
import java.util.Map;

public interface ProgramService {
	public int insert(Map params);
	public int delete(String programId);
	public List getProgramById(String id);
	public List getProgramByDate(String date);
}