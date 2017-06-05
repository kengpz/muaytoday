package today.muay.program.service;

import java.util.List;
import java.util.Map;

public interface RestTemplateService {
	public String getForString(String action, Map params);
	public Map getInterfaceExchangeForMap(String action, Map params);
	public String getXmlValue(String url) throws Exception;
	public List getForStringjson(String request);
	public List getForList(String action, Map params);
}