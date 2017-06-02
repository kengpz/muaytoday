package today.muay.program.dao;

import java.util.List;
import java.util.Map;

public interface ProgramDao {
	public List queryForList(Map params);
	public List queryForListByDate(String date);
	public List queryForListById(String programId);
	public int insert(Map params);
	public int update(Map params);
	public int delete(int programId);
}