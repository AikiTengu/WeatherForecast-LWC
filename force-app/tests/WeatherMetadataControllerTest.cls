@isTest
private class WeatherMetadataControllerTest {
	private static final String apiURL = 'http://api.openweathermap.org/data/2.5/weather?q=';

    @isTest
	static void testGettingMetadata() {

		Test.startTest();
		WeatherAPI__mdt returnedMetadata = WeatherMetadataController.getWeatherMetaData();
		Test.stopTest();


		System.assertEquals(apiURL, returnedMetadata.URL__c);
	}



}