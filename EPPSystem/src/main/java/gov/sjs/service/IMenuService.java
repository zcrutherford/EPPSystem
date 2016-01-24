package gov.sjs.service;

import gov.sjs.po.Menu;

import java.util.List;

public interface IMenuService {

	public List<Menu> getAllMenu();
	
	public void addMenu(Menu menu);
	
	public Menu getMenu(Menu menu);
}
