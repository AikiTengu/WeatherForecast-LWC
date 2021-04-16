public with sharing class AccountWeatherConsumer {
	@AuraEnabled(cacheable=true)
	public static WeatherDTO getWeatherByCity(String city) {
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		WeatherAPI__mdt weatherMetaData = WeatherMetadataController.getWeatherMetaData();
		String endpoint =
			weatherMetaData.URL__c +
			String.escapeSingleQuotes(city) +
			weatherMetaData.Params__c +
			weatherMetaData.Key__c;
		request.setEndpoint(endpoint);
		request.setMethod('GET');

		try {
			HttpResponse response = http.send(request);

			weatherDTO weatherResult = new weatherDTO();
			Object weatherREST;
			if (response.getStatusCode() == 200) {
				weatherResult = weatherDTO.parse(response.getBody());
			}
			return weatherResult;
		} catch (Exception e) {
			throw new AuraHandledException(e.getMessage());
		}
	}
}
