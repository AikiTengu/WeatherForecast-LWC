@isTest
global class WeatherConsumerMock implements HttpCalloutMock {
	private static final String JSONBODY = '{"coord":{"lon":-74.6413,"lat":39.8835},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":16.01,"feels_like":14.74,"temp_min":15.56,"temp_max":16.67,"pressure":1017,"humidity":41},"visibility":10000,"wind":{"speed":1.54,"deg":320},"clouds":{"all":1},"dt":1618343539,"sys":{"type":1,"id":6267,"country":"US","sunrise":1618309395,"sunset":1618356859},"timezone":-14400,"id":4500994,"name":"Object","cod":200}';

	global HTTPResponse respond(HTTPRequest request) {
		HttpResponse response = new HttpResponse();
		response.setHeader('Content-Type', 'application/json');
		response.setBody(JSONBODY);
		response.setStatusCode(200);
		return response;
	}
}
