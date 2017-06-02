package today.muay.program.dao;

import java.util.Map;

public interface StadiumDao {
	public int insert(String sid, String sname);
	public Number update(Map params);
}