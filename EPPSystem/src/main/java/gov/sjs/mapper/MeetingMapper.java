package gov.sjs.mapper;

import gov.sjs.po.Meeting;
import gov.sjs.po.MeetingSession;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.type.JdbcType;

public interface MeetingMapper {

	@SelectProvider(type=MeetingProvider.class, method="queryMeetingTimeByCondition")
	@Results(value = {
			@Result(property = "mtId", column = "MT_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "msId", column = "MS_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "meetingName", column = "MEETING_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "meetingContent", column = "MEETING_CONTENT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<Meeting> getmtByCondition(@Param("ms")String ms);
	
	@Select("SELECT * FROM meeting_session")
	@Results(value = {
			@Result(property = "msId", column = "MS_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "sessionName", column = "SESSION_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "msOperator", column = "MS_OPERATOR", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<MeetingSession> getMeetingSession();
	
	class MeetingProvider {
		public String queryMeetingTimeByCondition(Map<String, Object> params) {
			String ms = (String)params.get("ms");
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM meeting_times WHERE 1=1");
			if(StringUtils.isNotBlank(ms)) {
				sb.append(" AND MS_ID=#{ms}");
			}
			return sb.toString();
		}
	}
}
