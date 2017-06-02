package today.muay.program.dao.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import today.muay.program.dao.ProgramDao;

public class ProgramDaoImpl implements ProgramDao {
	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List queryForListByDate(String date) {

		return null;
	}

	public List queryForListById(String programId) {

		return null;
	}

	public int insert(Map params) {
		String sql = "INSERT INTO PROGRAMMUAY (PROGRAM_ID, STADIUM_ID, DATE_MATCH, CAMPAIGN_NAME, PROMOTER_NAME, TICKET_PRICE) VALUES (:PROGRAM_ID, :STADIUM_ID, :DATE_MATCH, :CAMPAIGN_NAME, :PROMOTER_NAME, :TICKET_PRICE)";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("PROGRAM_ID", Integer.parseInt(String.valueOf(params.get("PROGRAM_ID"))));
		paramSource.addValue("STADIUM_ID", params.get("STADIUM_ID"));
		paramSource.addValue("DATE_MATCH", params.get("QUANTITY"));
		paramSource.addValue("CAMPAIGN_NAME", params.get("DATE_MATCH"));
		paramSource.addValue("PROMOTER_NAME", params.get("PROMOTER_NAME"));
		paramSource.addValue("TICKET_PRICE", params.get("TICKET_PRICE"));

		int result = namedParameterJdbcTemplate.update(sql, paramSource);

		return result;
	}

	public int update(Map params) {

		return 0;
	}

	public int delete(int programId) {
		String sql = "DELETE FROM PROGRAMMUAY WHERE PROGRAM_ID = :PROGRAM_ID";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("PROGRAM_ID", programId);

		int result = namedParameterJdbcTemplate.update(sql, paramSource);

		return result;
	}

	public List queryForList(Map params) {
		// TODO Auto-generated method stub
		return null;
	}
}