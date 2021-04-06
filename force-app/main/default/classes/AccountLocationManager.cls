public inherited sharing class AccountLocationManager {
    @AuraEnabled(cacheable=true)
    public static String getCity(String accountId) {
       Account acc =  [SELECT BillingCity
                        FROM Account
                        WHERE ID = :accountId];
       String city = acc.BillingCity;
       return city;
    }
}