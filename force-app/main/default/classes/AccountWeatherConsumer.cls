public inherited sharing class AccountWeatherConsumer {
    private final static String APIURL = 'http://api.openweathermap.org/data/2.5/weather?q=';
    private final static String APIPARAMS = '&units=metric&APPID=';
    @AuraEnabled(cacheable=true)
    public static Object getWeatherByCity(String city, String apiKey){
        Object weatherREST;
        WeatherPOJO weatherResult = new WeatherPOJO();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(String.escapeSingleQuotes(APIURL) + String.escapeSingleQuotes(city) + String.escapeSingleQuotes(APIPARAMS) + String.escapeSingleQuotes(ApiKey));
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
    	// parse the JSON response
         if (response.getStatusCode() == 200) {
             Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             weatherREST = result.get('main');
        }
       return weatherREST;
}
}