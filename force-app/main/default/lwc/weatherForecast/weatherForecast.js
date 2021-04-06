import { LightningElement, api, track, wire } from "lwc";
import getCity from "@salesforce/apex/AccountLocationManager.getCity";
import getWeatherByCity from "@salesforce/apex/AccountWeatherConsumer.getWeatherByCity"; 
export default class WeatherForecast extends LightningElement {	
    APIKEY = '9c9350d7547dca5651483d1e364cc1fa';
    //getting account id from url
    accountId=window.location.href.split('/')[6];
	city;	
    weather;
    temp;
    humidity;
    pressure;
    wind;
    clouds;


    @wire(getCity, { accountId: '$accountId'})
    wireCity({error, data}){
        if (data) {
            this.city = data;
        }
        if (error) {
            console.log('errorCity');
            this.error = error;
        }
    }

    @wire(getWeatherByCity, {city: '$city', apiKey: '$APIKEY'})
    wireWeatherPOJO({error, data}) {
        if (data) {
            this.weather = data;
            console.log(this.weather);
            this.temp=this.weather.temp;
            this.humidity=this.weather.humidity;
            this.pressure=this.weather.pressure;
            console.log(this.temp + ' ' + this.humidity + ' ' + this.pressure);
        }
        if (error) {
            console.log('errorWeather');
            this.error = error;
        }
    }

    get errors() {
		return this.error ? reduceErrors(this.error) : [];
	}
}