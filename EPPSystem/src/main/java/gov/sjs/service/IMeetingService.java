package gov.sjs.service;

import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;

import java.util.List;

public interface IMeetingService {

	public List<MeetingTimes> getmtByCondition(String ms);
	
	public List<MeetingSession> getMeetingSession();
}
