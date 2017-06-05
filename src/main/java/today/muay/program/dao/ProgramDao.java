package today.muay.program.dao;

import java.util.List;
import java.util.Map;

public interface ProgramDao {
	public List getProgramByDate(String date);
	public List getProgramById(String id);
	public int insert(Map<String,String> params);
	public int delete(int programId);
}