require 'json'
require 'rest-client'
require 'pry'

class Weather

  attr_accessor :location, :city
    def initialize()
    end

    def greeting

      puts "This app will tell you the weather temperature for a chosen location and city"
      
      puts "Chose which state you'd like to get the weather temperature for ... type 'IA' for IOWA"
      @state = gets.strip
      
      puts "Choose which city you'd like to get the weather temperature for ... type 'Cedar_Rapids' for Cedar Rapids"
      @city = gets.strip

    end

    def get_forecast
      response = RestClient.get('http://api.wunderground.com/api/1cf4679a5d9210cf/geolookup/conditions/q/' + @state + '/' + @city +'.json')
      parsed_weather = JSON.parse(response)
      temp_f = parsed_weather['current_observation']['temp_f']
      city = @city.split('_')
      readable_city = city.join(' ')
      puts "Current temperature in #{readable_city} is " + temp_f.to_s
    end
end

new_search = Weather.new
new_search.greeting
new_search.get_forecast