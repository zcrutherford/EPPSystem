package gov.sjs.po;

/** 
* @ClassName: Menu 
* @Description: TODO
* @author zc 
* @date 2016年1月16日 下午3:12:43 
*  
*/
public class Menu {

	private String id;
	private String parent;
	private String name;
	private String url;
	private String target = "myframe";
	
	public Menu(){}
	
	public Menu(String parent,String name,String url){
		this.parent = parent;
		this.name = name;
		this.url = url;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	
}
