## Option Number 1
require 'pry'
require 'wunderground'

class Weather
  
    attr_accessor :state, :city
      def initialize()
      end
  
      def greeting
        puts "This app will tell you the weather temperature for a chosen state and city"
        puts "Chose which country you'd like to get the weather for ... type 'IA' for IOWA"
        @state = gets.strip
        puts "Choose which city you'd like to get the weather for. Type 'Cedar Heights' for Cedar Heights"
        @city = gets.strip
      end
  
      def get_forecast
        w = Wunderground.new("1cf4679a5d9210cf")
        return w.forecast_for(@state,@city)
      end

 end
 

# #Creating new instance of Weather 
new_search = Weather.new
# #Putting the greeting in the terminal AND
# #setting the country and city based on user input
new_search.greeting
# #Now that the user input has define the country attribute and the city attribute
# #--it can be used in the get_forecast function
# #This function will return the forecast in hash with "response" and then forecast" as keys
search_results = new_search.get_forecast
text_forecast_period_1 = search_results["forecast"]["txt_forecast"]["forecastday"][1]["fcttext"]
puts text_forecast_period_1

counter = 1
text_forecast_period = search_results["forecast"]["txt_forecast"]["forecastday"]
text_forecast_period.each do |period|
  puts "----"
  puts "Period #{counter}: #{period["fcttext"]}"
  puts "----"
  counter += 1
end



  
## Option Number 2

# class Weather
#     attr_accessor :country, :city
#       def initialize()
#       end
  
#       def greeting
#         puts "This app will tell you the weather temperature for a chosen country and city"
#         puts "Chose which country you'd like to get the weather for ... type 'France' for France"
#         puts "Choose which city you'd like to get the weather for. Type 'Paris' for Paris"
#       end
  
#       def get_forecast
#         @country = gets.strip
#         @city = gets.strip
#         w = Wunderground.new("1cf4679a5d9210cf")
#         return w.forecast_for(@country,@city)
#       end
#  end

#  #This is a bit cleaner
#  #The greeting is simply text
#  #The get_forecast asks for the input and returns the data 
#  #seems a bit more true to the functions names

# #Creating new instance of Weather 
#  new_search = Weather.new
#  #Putting the greeting in the terminal
#  new_search.greeting
#  #setting the country and city based on user input
#  #AND this function will return the forecast in hash with "response" and then "forecast" as keys
#  new_search.get_forecast