package gov.sjs.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BeanFactoryUtil implements ServletContextListener {
	private static Log logger = LogFactory.getLog(BeanFactoryUtil.class);
	private static ApplicationContext context;

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent event) {
		logger.info("初始化BeanFactory....");
		context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		logger.info("初始化BeanFactory....OK.");
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}

	public static Object getBean(String name){
		return context.getBean(name);
	}
	
}
