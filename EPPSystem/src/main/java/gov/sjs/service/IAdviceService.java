package gov.sjs.service;

import gov.sjs.po.Advice;

import java.util.List;

public interface IAdviceService {

	public List<Advice> getAdviceByCondition(Advice advice,String displayStart,String displayLength);
	
	public int getAdviceCountByCondition(Advice advice);
	
	public void addAdvice(Advice advice);
}
