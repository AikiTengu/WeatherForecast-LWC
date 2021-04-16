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

	@wire(getCity, { accountId: "$recordId" })
	wireCity({ error, data }) {
		if (data) {
			this.city = data;
		}
		if (error) {
			this.error = error;
		}
	}

	@wire(getWeatherByCity, { city: "$city" })
	wireWeatherDTO({ error, data }) {
		if (data) {
			console.log(data);
			this.weather = data;
			this.temp = this.weather.main.temp;
			this.humidity = this.weather.main.humidity;
			this.pressure = this.weather.main.pressure;
		}
		if (error) {
			this.error = error;
		}
	}

	get errors() {
		return this.error ? reduceErrors(this.error) : [];
	}
}
