package gov.sjs.service;

import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;

import java.util.List;

public interface IMeetingService {

	public List<MeetingTimes> getmtByCondition(String ms);
	
	public List<MeetingSession> getMeetingSession();
	
	public List<MeetingTimes> getMeetingTimes(MeetingTimes meeting,int displayStart,int displayLength);

	public int getMeetingTimesCount(MeetingTimes meeting);
	
	public void deleteMeetingTime(String mtId);
	
	public void addMs(MeetingSession meeting);
	
	public void addMt(MeetingTimes meeting);
}
