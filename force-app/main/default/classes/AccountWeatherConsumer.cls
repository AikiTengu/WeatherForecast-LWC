public with sharing class AccountWeatherConsumer {

	@AuraEnabled(cacheable=true)
	public static Object getWeatherByCity(String city) {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		WeatherAPI__mdt weatherMetaData = WeatherMetadataController.getWeatherMetaData();
		String endpoint = weatherMetaData.URL__c + String.escapeSingleQuotes(city) + weatherMetaData.Params__c + weatherMetaData.Key__c;
		request.setEndpoint(endpoint);
		request.setMethod('GET');

		try {
			HttpResponse response = http.send(request);
			// If the request is successful, parse the JSON response.
			// parse the JSON response
			Object weatherREST;
			if (response.getStatusCode() == 200) {
				Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
				weatherREST = result.get('main');
			}
			return weatherREST;
		} catch (Exception e) {
			throw new AuraHandledException(e.getMessage());
		}
	}
}
