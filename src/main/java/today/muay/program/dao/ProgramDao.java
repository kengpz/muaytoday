package today.muay.program.dao;

import java.util.Map;

public interface ProgramDao {
	public int insert(Map<String,String> params);
	public int delete(int programId);
}