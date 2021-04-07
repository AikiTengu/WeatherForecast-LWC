public inherited sharing class AccountWeatherConsumer {
    private final static String APIURL = 'http://api.openweathermap.org/data/2.5/weather?q=';
    private final static String APIPARAMS = '&units=metric&APPID=';
    private final static String APIKEY = '9c9350d7547dca5651483d1e364cc1fa';

    @AuraEnabled(cacheable=true)
    public static Object getWeatherByCity(String city){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(APIURL + String.escapeSingleQuotes(city) + APIPARAMS + APIKEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
    	// parse the JSON response
        Object weatherREST;
         if (response.getStatusCode() == 200) {
             Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             weatherREST = result.get('main');
        }
        return weatherREST;
}
}