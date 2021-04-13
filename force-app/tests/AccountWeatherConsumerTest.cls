@isTest
public class AccountWeatherConsumerTest {
	private static String CITY = 'Burlington';
	private static Integer JSONTEMP = 1017;

	@isTest
	static void AccountWeatherConsumerTest() {
		Test.setMock(HttpCalloutMock.class, new WeatherConsumerMock());
		Object result = AccountWeatherConsumer.getWeatherByCity(CITY);
		System.assertNotEquals(null, result);
	}
}
