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

	public int insert(Map params) {
		String sql = "INSERT INTO PROGRAMMUAY (STADIUM_ID, DATE_MATCH, CAMPAIGN_NAME, PROMOTER_NAME, TICKET_PRICE) VALUES (:STADIUM_ID, :DATE_MATCH, :CAMPAIGN_NAME, :PROMOTER_NAME, :TICKET_PRICE)";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("STADIUM_ID", Integer.parseInt(String.valueOf(params.get("STADIUM_ID"))));
		paramSource.addValue("DATE_MATCH", params.get("DATE_MATCH"));
		paramSource.addValue("CAMPAIGN_NAME", params.get("CAMPAIGN_NAME"));
		paramSource.addValue("PROMOTER_NAME", params.get("PROMOTER_NAME"));
		paramSource.addValue("TICKET_PRICE", Integer.parseInt(String.valueOf(params.get("TICKET_PRICE"))));

		int result = namedParameterJdbcTemplate.update(sql, paramSource);

		return result;
	}

	public int delete(int programId) {
		String sql = "DELETE FROM PROGRAMMUAY WHERE PROGRAM_ID = :PROGRAM_ID";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("PROGRAM_ID", programId);
		int result = namedParameterJdbcTemplate.update(sql, paramSource);

		return result;
	}

	public List getProgramByDate(String date) {
		String sql = "SELECT * FROM PROGRAMMUAYINFO JOIN PROGRAMMUAY ON PROGRAMMUAY.PROGRAM_ID = PROGRAMMUAYINFO.PROGRAM_ID JOIN STADIUM ON STADIUM.STADIUM_ID = PROGRAMMUAY.STADIUM_ID  WHERE PROGRAMMUAYINFO.PROGRAM_ID = (SELECT PROGRAM_ID FROM PROGRAMMUAY WHERE DATE_MATCH = '"+date+"')";
		System.out.println("SQL = " + sql);
		List list = jdbcTemplate.queryForList(sql);

		return list;
	}

	public List getProgramById(String id) {
		String sql = "SELECT * FROM PROGRAMMUAYINFO WHERE PROGRAM_ID = " + Integer.parseInt(id);
		List list = jdbcTemplate.queryForList(sql);

		return list;
	}
}