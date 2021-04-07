public inherited sharing class AccountLocationManager {
    @AuraEnabled(cacheable=true)
    public static String getCity(String accountId) {
       Account acc =  [SELECT ShippingCity
                        FROM Account
                        WHERE ID = :accountId];
       String city = acc.ShippingCity;
       return city;
    }
}