package today.muay.program.dao.impl;

import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import today.muay.program.dao.StadiumDao;

public class StadiumDaoImpl implements StadiumDao {
	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public Number insert(String name) {
		String sql = "INSERT INTO STADIUM (STADIUM_NAME) VALUES (:STADIUM_NAME)";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("STADIUM_NAME", name);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		namedParameterJdbcTemplate.update(sql, paramSource, keyHolder, new String[] { "STADIUM_ID" });

		return keyHolder.getKey();
	}

	public Number update(Map params) {
		String sql = "UPDATE STADIUM SET STADIUM_NAME = :STADIUM_NAME WHERE STADIUM_ID = :STADIUM_ID";

		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("STADIUM_ID", params.get("STADIUM_ID"));
		paramSource.addValue("STADIUM_NAME", params.get("STADIUM_NAME"));
		Number result = namedParameterJdbcTemplate.update(sql, paramSource);

		return result;
	}
}