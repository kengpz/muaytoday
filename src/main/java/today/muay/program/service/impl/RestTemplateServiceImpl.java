package today.muay.program.service.impl;

import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import java.util.List;
import java.util.Map;

import today.muay.program.service.RestTemplateService;

import today.muay.program.json.JsonObjectMapper;
import today.muay.program.service.RestTemplateService;
import com.fasterxml.jackson.databind.ObjectMapper;

public class RestTemplateServiceImpl implements RestTemplateService {
	private static Logger logger = LoggerFactory.getLogger(RestTemplateServiceImpl.class);
	private ObjectMapper objectMapper;
	private RestTemplate restTemplate;
	private HttpHeaders httpHeaders;
	private String url;
	private String ixUrl;

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
		this.restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
	}

	public void setHttpHeaders(HttpHeaders httpHeaders) {
		MediaType mediaType = new MediaType("application", "json", Charset.forName("UTF-8"));
		this.httpHeaders = httpHeaders;
		this.httpHeaders.setContentType(mediaType);
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setIxUrl(String ixUrl) {
		this.ixUrl = ixUrl;
	}

	public String getForString(String action, Map params) {
		logger.info("GetForString : Action = " + url + action + ", Params = " + params);

		try {
			String json = objectMapper.writeValueAsString(params);
			HttpEntity<String> requestEntity = new HttpEntity<String>(json, httpHeaders);
			ResponseEntity<String> responseEntity = restTemplate.exchange(url + action, HttpMethod.POST, requestEntity, String.class);
			String response = objectMapper.readValue(responseEntity.getBody(), String.class);

			return response;
		} catch (Exception exception) {
			logger.info("GetForString : Action = " + url + action + ", Params = " + params + ", Exception = " + exception);
			return null;
		}
	}

	public Map getInterfaceExchangeForMap(String action, Map params) {
		logger.info("GetForMap : Action = " + action + ", Params = " + params);

		try {
			String json = objectMapper.writeValueAsString(params);
			HttpEntity<String> requestEntity = new HttpEntity<String>(json, httpHeaders);
			ResponseEntity<String> responseEntity = restTemplate.exchange(ixUrl + action, HttpMethod.POST, requestEntity, String.class);
			Map response = objectMapper.readValue(responseEntity.getBody(), Map.class);

			return response;
		} catch (Exception exception) {
			logger.info("GetForMap : Action = " + ixUrl + action + ", Params = " + params + ", Exception = " + exception);
			return null;
		}
	}

	public List getForStringjson(String request) {
		logger.info("GetForString : Url = " + request);
		try {
			String xml = restTemplate.getForObject(request, String.class);
			String json = JsonObjectMapper.getInstance().writeValueAsStringByXmlMapper(xml);
			HttpEntity<String> requestEntity = new HttpEntity<String>(json, httpHeaders);
			ResponseEntity<String> responseEntity = restTemplate.exchange(request, HttpMethod.POST, requestEntity, String.class);
			List response = objectMapper.readValue(json, List.class);
			
			return response;
		} catch (Exception exception) {
			logger.info(exception.toString());
			return null;
		}
	}

	public String getXmlValue(String request) throws Exception {
		return restTemplate.getForObject(request, String.class);
	}
}