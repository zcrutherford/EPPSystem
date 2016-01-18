package gov.sjs.mapper;

import gov.sjs.po.Menu;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;

public interface MenuMapper {

	@SelectProvider(type=MenuProvider.class, method="queryAllMenuList")
	@Results(value = {
			@Result(id = true, property = "id", column = "MENU_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "parent", column = "MENU_PID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "name", column = "MENU_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "url", column = "MENU_URL", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<Menu> getAllMenu();
	
	class MenuProvider {
		public String queryAllMenuList() {
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM sys_menu");
			return sb.toString();
		}
	}
}
