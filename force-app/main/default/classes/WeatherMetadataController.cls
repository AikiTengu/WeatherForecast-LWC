public with sharing class WeatherMetadataController {
    @AuraEnabled(cacheable=true)
    public static WeatherAPI__mdt getWeatherMetaData() {
        return [SELECT URL__c, Key__c, Params__c FROM WeatherAPI__mdt].get(0);
    }
}
