import { LightningElement, api, track, wire } from "lwc";
import getCity from "@salesforce/apex/AccountLocationManager.getCity";
import getWeatherByCity from "@salesforce/apex/AccountWeatherConsumer.getWeatherByCity"; 
export default class WeatherForecast extends LightningElement {	
    //getting accountId
    @api recordId;

	city;	
    weather;
    temp;
    humidity;
    pressure;
    wind;
    clouds;


    @wire(getCity, { accountId: '$recordId'})
    wireCity({error, data}){
        if (data) {
            this.city = data;
        }
        if (error) {
            this.error = error;
        }
    }

    @wire(getWeatherByCity, {city: '$city'})
    wireWeatherPOJO({error, data}) {
        if (data) {
            this.weather = data;
            this.temp=this.weather.temp;
            this.humidity=this.weather.humidity;
            this.pressure=this.weather.pressure;
        }
        if (error) {
            this.error = error;
        }
    }

    get errors() {
		return this.error ? reduceErrors(this.error) : [];
	}
}