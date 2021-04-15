@isTest
public class AccountLocationManagerTest {
	private static String NAME = 'testAccount';
	private static String CITY = 'LVIV';
	@TestSetup
	static void makeData() {
		Account testAccount = new Account();
		testAccount.Name = NAME;
		testAccount.ShippingCity = CITY;
		insert testAccount;
	}

	@isTest
	static void AccountLocationManagerTest() {
		Account testAccount = [SELECT ShippingCity FROM Account WHERE ShippingCity = 'LVIV' LIMIT 1];
        String testId = testAccount.Id;
        String testCity = testAccount.ShippingCity;
        String actualCity = AccountLocationManager.getCity(testId);

        System.assertEquals(testCity, actualCity);
	}
}
