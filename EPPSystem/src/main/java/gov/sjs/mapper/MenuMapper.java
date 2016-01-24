package gov.sjs.mapper;

import gov.sjs.po.Menu;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
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
	
	@Select("SELECT * FROM sys_menu WHERE MENU_PID=#{menu.parent} AND MENU_NAME=#{menu.name} AND MENU_URL=#{menu.url}")
	@Results(value = {
			@Result(id = true, property = "id", column = "MENU_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "parent", column = "MENU_PID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "name", column = "MENU_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "url", column = "MENU_URL", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public Menu getMenu(@Param("menu")Menu menu);
	
	@Insert("INSERT INTO sys_menu(MENU_PID,MENU_NAME,MENU_URL) VALUE(#{menu.parent},#{menu.name},#{menu.url})")
	public void addMenu(@Param("menu")Menu menu);
	
	class MenuProvider {
		public String queryAllMenuList() {
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM sys_menu");
			return sb.toString();
		}
	}
}
