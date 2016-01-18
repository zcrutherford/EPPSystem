package gov.sjs.service.impl;

import gov.sjs.mapper.MenuMapper;
import gov.sjs.po.Menu;
import gov.sjs.service.IMenuService;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService implements IMenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	private Log logger = LogFactory.getLog(MenuService.class);
	
	public List<Menu> getAllMenu() {
		logger.debug("进入 MenuService.getAllMenu()方法");
		return menuMapper.getAllMenu();
	}

}
