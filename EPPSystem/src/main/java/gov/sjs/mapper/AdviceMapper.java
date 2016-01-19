package gov.sjs.mapper;

import gov.sjs.po.Advice;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;

public interface AdviceMapper {

	@SelectProvider(type=AdviceProvider.class, method="queryAdviceByCondition")
	@Results(value = {
			@Result(property = "daId", column = "DA_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "msId", column = "MS_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "mtId", column = "MT_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "msType", column = "MS_TYPE", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "daSubject", column = "DA_SUBJECT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "ledDeputy", column = "LED_DEPUTY", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "daDeputy", column = "DA_DEPUTY", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "assignedStatus", column = "ASSIGNED_STATUS", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "hostUnit", column = "HOST_UNIT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "daDeputation", column = "DA_DEPUTATION", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "daContent", column = "DA_CONTENT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "assignedReport", column = "ASSIGNED_REPORT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<Advice> getAdviceByCondition(@Param("advice")Advice advice,@Param("displayStart")String displayStart,@Param("displayLength")String displayLength);
	
	@SelectProvider(type=AdviceProvider.class, method="queryAdviceCountByCondition")
	public int getAdviceCountByCondition(@Param("advice")Advice advice);
	
	@Insert("INSERT INTO deputy_advise_info(MS_ID,MT_ID,MS_TYPE,DA_SUBJECT,"
			+ "LED_DEPUTY,DA_DEPUTY,ASSIGNED_STATUS,HOST_UNIT,DA_DEPUTATION,DA_CONTENT,ASSIGNED_REPORT) "
			+ "VALUES(#{advice.msId},#{advice.mtId},#{advice.msType},#{advice.daSubject},#{advice.ledDeputy}"
			+ ",#{advice.daDeputy},0,#{advice.hostUnit},#{advice.daDeputation},#{advice.daContent},#{advice.assignedReport})")
	public int addAdvice(@Param("advice")Advice advice);
	
	class AdviceProvider {
		public String queryAdviceByCondition(Map<String, Object> params) {
			Advice advice = (Advice)params.get("advice");
			String displayStart = (String)params.get("displayStart");
			String displayLength = (String)params.get("displayLength");
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM deputy_advise_info WHERE 1=1");
			if(StringUtils.isNotBlank(advice.getMsId())) {
				//届
				sb.append(" AND MS_ID=#{advice.msId}");
			}
			if(StringUtils.isNotBlank(advice.getMtId())) {
				//次
				sb.append(" AND MT_ID=#{advice.mtId}");
			}
			if(StringUtils.isNotBlank(advice.getDaSubject())) {
				//题目
				sb.append(" AND DA_SUBJECT LIKE '%"+ advice.getDaSubject() +"%'");
			}
			if(StringUtils.isNotBlank(advice.getMsType())) {
				//题目
				sb.append(" AND MS_TYPE=#{advice.msType}");
			}
			if(StringUtils.isNotBlank(advice.getAssignedStatus())) {
				//状态
				sb.append(" AND ASSIGNED_STATUS=#{advice.assignedStatus}");
			}
			if(StringUtils.isNotBlank(advice.getDaId())) {
				//建议编号
				sb.append(" AND DA_ID=#{advice.daId}");
			}
			if(StringUtils.isNotBlank(advice.getHostUnit())) {
				//建议编号
				sb.append(" AND HOST_UNIT=#{advice.hostUnit}");
			}
			sb.append(" LIMIT " + displayStart + "," + displayLength);
			return sb.toString();
		}
		
		public String queryAdviceCountByCondition(Map<String, Object> params) {
			Advice advice = (Advice)params.get("advice");
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT COUNT(*) FROM deputy_advise_info WHERE 1=1");
			if(StringUtils.isNotBlank(advice.getMsId())) {
				//届
				sb.append(" AND MS_ID=#{advice.msId}");
			}
			if(StringUtils.isNotBlank(advice.getMtId())) {
				//次
				sb.append(" AND MT_ID=#{advice.mtId}");
			}
			if(StringUtils.isNotBlank(advice.getDaSubject())) {
				//题目
				sb.append(" AND DA_SUBJECT LIKE '%"+ advice.getDaSubject() +"%'");
			}
			if(StringUtils.isNotBlank(advice.getMsType())) {
				//题目
				sb.append(" AND MS_TYPE=#{advice.msType}");
			}
			if(StringUtils.isNotBlank(advice.getAssignedStatus())) {
				//状态
				sb.append(" AND ASSIGNED_STATUS=#{advice.assignedStatus}");
			}
			if(StringUtils.isNotBlank(advice.getDaId())) {
				//建议编号
				sb.append(" AND DA_ID=#{advice.daId}");
			}
			if(StringUtils.isNotBlank(advice.getHostUnit())) {
				//建议编号
				sb.append(" AND HOST_UNIT=#{advice.hostUnit}");
			}
			return sb.toString();
		}
	}
}
