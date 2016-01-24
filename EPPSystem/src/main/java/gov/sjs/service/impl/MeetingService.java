package gov.sjs.service.impl;

import gov.sjs.mapper.MeetingMapper;
import gov.sjs.po.MeetingSession;
import gov.sjs.po.MeetingTimes;
import gov.sjs.service.IMeetingService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MeetingService implements IMeetingService {

	@Autowired
	private MeetingMapper meetingMapper;
	
	public List<MeetingTimes> getmtByCondition(String ms) {
		return meetingMapper.getmtByCondition(ms);
	}
	
	public List<MeetingSession> getMeetingSession() {
		return meetingMapper.getMeetingSession();
	}
	
	public List<MeetingTimes> getMeetingTimes(MeetingTimes meeting,int displayStart,int displayLength) {
		return meetingMapper.getMeetingTimes(meeting,displayStart,displayLength);
	}
	
	public int getMeetingTimesCount(MeetingTimes meeting) {
		return meetingMapper.getMeetingTimesCount(meeting);
	}

	public void deleteMeetingTime(String mtId) {
		meetingMapper.deleteMeetingTime(mtId);
	}
	
	public void addMs(MeetingSession meeting) {
		meetingMapper.addMs(meeting);
	}
	
	public void addMt(MeetingTimes meeting) {
		meetingMapper.addMt(meeting);
	}
}
