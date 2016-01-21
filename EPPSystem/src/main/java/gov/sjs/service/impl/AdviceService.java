package gov.sjs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gov.sjs.mapper.AdviceMapper;
import gov.sjs.po.Advice;
import gov.sjs.service.IAdviceService;
@Service
public class AdviceService implements IAdviceService {

	@Autowired
	private AdviceMapper adviceMapper;
	
	public List<Advice> getAdviceByCondition(Advice advice,String displayStart,String displayLength) {
		return adviceMapper.getAdviceByCondition(advice,displayStart,displayLength);
	}
	
	public int getAdviceCountByCondition(Advice advice) {
		return adviceMapper.getAdviceCountByCondition(advice);
	}
	
	public void addAdvice(Advice advice) {
		adviceMapper.addAdvice(advice);
	}
	
	public void updateAdvice(Advice advice) {
		adviceMapper.updateAdvice(advice);
	}
	
	public void deleteAdvice(Advice advice) {
		adviceMapper.deleteAdvice(advice);
	}

}
