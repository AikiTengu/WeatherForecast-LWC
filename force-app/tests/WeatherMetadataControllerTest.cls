@isTest
private class WeatherMetadataControllerTest {
	private static final String APIURL = 'http://api.openweathermap.org/data/2.5/weather?q=';

	@isTest
	static void testGettingMetadata() {
		Test.startTest();
		WeatherAPI__mdt returnedMetadata = WeatherMetadataController.getWeatherMetaData();
		Test.stopTest();

		System.assertEquals(APIURL, returnedMetadata.URL__c);
	}
}
