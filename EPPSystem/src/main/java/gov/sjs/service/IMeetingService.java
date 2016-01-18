package gov.sjs.service;

import gov.sjs.po.Meeting;
import gov.sjs.po.MeetingSession;

import java.util.List;

public interface IMeetingService {

	public List<Meeting> getmtByCondition(String ms);
	
	public List<MeetingSession> getMeetingSession();
}
