package gov.sjs.mapper;

import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
	public List<MeetingTimes> getmtByCondition(@Param("ms")String ms);
	
	@Select("SELECT * FROM meeting_session")
	@Results(value = {
			@Result(property = "msId", column = "MS_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "sessionName", column = "SESSION_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "msOperator", column = "MS_OPERATOR", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<MeetingSession> getMeetingSession();
	
	@SelectProvider(type=MeetingProvider.class, method="queryMeeting")
	@Results(value = {
			@Result(property = "mtId", column = "MT_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "msId", column = "MS_ID", javaType = String.class, jdbcType = JdbcType.INTEGER),
			@Result(property = "meetingName", column = "MEETING_NAME", javaType = String.class, jdbcType = JdbcType.VARCHAR),
			@Result(property = "meetingContent", column = "MEETING_CONTENT", javaType = String.class, jdbcType = JdbcType.VARCHAR),
				})
	public List<MeetingTimes> getMeetingTimes(@Param("meeting")MeetingTimes meeting,@Param("displayStart")int displayStart,@Param("displayLength")int displayLength);
	
	@SelectProvider(type=MeetingProvider.class, method="queryMeetingCount")
	public int getMeetingTimesCount(@Param("meeting")MeetingTimes meeting);
	
	@Delete("DELETE FROM meeting_times WHERE MT_ID=#{mtId}")
	public void deleteMeetingTime(@Param("mtId")String mtId);
	
	@Insert("INSERT INTO meeting_session(MS_ID,SESSION_NAME) VALUES(#{meeting.msId},#{meeting.sessionName})")
	public void addMs(@Param("meeting")MeetingSession meeting);
	
	@Insert("INSERT INTO meeting_times(MT_ID,MS_ID,MEETING_NAME,MEETING_CONTENT) VALUES(#{meeting.mtId},#{meeting.msId},#{meeting.meetingName},#{meeting.meetingContent})")
	public void addMt(@Param("meeting")MeetingTimes meeting);
	
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
		
		public String queryMeeting(Map<String, Object> params) {
			MeetingTimes meeting = (MeetingTimes)params.get("meeting");
			int displayStart = (Integer)params.get("displayStart");
			int displayLength = (Integer)params.get("displayLength");
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM meeting_times WHERE 1=1");
			if(StringUtils.isNotBlank(meeting.getMsId())) {
				sb.append(" AND MS_ID=#{meeting.msId}");
			}
			if(StringUtils.isNotBlank(meeting.getMtId())) {
				sb.append(" AND MT_ID=#{meeting.mtId}");
			}
			if(StringUtils.isNotBlank(meeting.getMeetingName())) {
				sb.append(" AND MEETING_NAME LIKE '%"+meeting.getMeetingName()+"%'");
			}
			if(StringUtils.isNotBlank(meeting.getMeetingContent())) {
				sb.append(" AND MEETING_CONTENT LIKE '%"+meeting.getMeetingContent()+"%'");
			}
			sb.append(" LIMIT "+ displayStart +" ,"+ displayLength);
			return sb.toString();
		}
		
		public String queryMeetingCount(Map<String, Object> params) {
			MeetingTimes meeting = (MeetingTimes)params.get("meeting");
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT COUNT(1) FROM meeting_times WHERE 1=1");
			if(StringUtils.isNotBlank(meeting.getMsId())) {
				sb.append(" AND MS_ID=#{meeting.msId}");
			}
			if(StringUtils.isNotBlank(meeting.getMtId())) {
				sb.append(" AND MT_ID=#{meeting.mtId}");
			}
			if(StringUtils.isNotBlank(meeting.getMeetingName())) {
				sb.append(" AND MEETING_NAME LIKE '%"+meeting.getMeetingName()+"%'");
			}
			if(StringUtils.isNotBlank(meeting.getMeetingContent())) {
				sb.append(" AND MEETING_CONTENT LIKE '%"+meeting.getMeetingContent()+"%'");
			}
			return sb.toString();
		}
	}
}
