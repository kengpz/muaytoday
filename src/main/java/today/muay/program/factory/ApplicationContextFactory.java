package today.muay.program.factory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextFactory {
	private static ApplicationContextFactory applicationContextFactory;
	private ApplicationContext context;

	static {
		applicationContextFactory = new ApplicationContextFactory();
	}

	private ApplicationContextFactory() {
		context = new ClassPathXmlApplicationContext(new String[] { "muay.xml" });
	}

	public static ApplicationContextFactory getInstance() {
		return applicationContextFactory;
	}

	public Object getBean(String id) {
		return context.getBean(id);
	}
}