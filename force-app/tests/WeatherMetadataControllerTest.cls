@isTest
private class WeatherMetadataControllerTest {
	@testSetup
	static void makeData() {
        WeatherAPI__mdt metadata = new WeatherAPI__mdt();
        metadata.URL__c = 'test url';
        metadata.Key__c = 'test key';
        metadata.Params__c = 'test params';
	}

    @isTest
	static void testGettingMetadata() {

		Test.startTest();
		WeatherAPI__mdt testMetadata = WeatherMetadataController.getWeatherMetaData();
		Test.stopTest();

		System.assertEquals('test url', testMetadata.URL__c);
        System.assertEquals('test key', testMetadata.Key__c);
        System.assertEquals('test params', testMetadata.Params__c);
	}



}