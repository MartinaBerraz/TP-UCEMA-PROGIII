// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree ./application

//= require jquery
//= require jquery_ujs
//= require_tree

// Elementos
const iconElement = document.querySelector(".weather-icon");
const tempElement = document.querySelector(".temperature-value p");
const descElement = document.querySelector(".temperature-description p");
const locationElement = document.querySelector(".location p");


// Datos de la App
const weather = {};

weather.temperature = {
    unit : "celsius"
}


getWeather();
// obtengo datos api
function getWeather(){

    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://api.openweathermap.org/data/2.5/weather?q=Buenos%20Aires&units=metric&appid=8ff0f232057223823313bca2059fe178&lang=es', true);

    xhr.onload = function(){
        document.getElementById('clima-loader').hidden = true;
        if(this.status == 200){
            let data = JSON.parse(this.responseText);

            let city= data.name;
            let cityHTML = `<span>${city}</span>`
            let climaDescription = data.weather[0].description;
            let climatemp= data.main.temp;
            let climatempHTML = `<span>${climatemp} ºC </span>`
            let climaHTML = `<span>Clima: ${climaDescription}</span>`
            let iconid= data.weather[0].icon;


            document.getElementById('city-container').innerHTML = cityHTML;

            document.getElementById('temp-container').innerHTML = climatempHTML;
            document.getElementById('icon-container').innerHTML = `<img src="../../icons/${iconid}.png"/>`;


        }
    }

    xhr.onprogress = function(){
        document.getElementById('clima-loader').hidden = false;
    }


    xhr.onerror = function(){
        document.getElementById('clima-loader').hidden = true;
        console.log('Request Error...');
    }

    xhr.send();


}
