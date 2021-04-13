public with sharing class AccountLocationManager {
	@AuraEnabled(cacheable=true)
	public static String getCity(ID accountId) {
		Account acc = [SELECT ShippingCity FROM Account WHERE ID = :accountId];
		String city = acc.ShippingCity;
		return city;
	}
}
