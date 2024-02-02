require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# configuration for better_errors

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')





get("/") do
  
  erb(:home)  
end

get("/rock") do
  
  @user = "rock"
  @computer = ["rock", "paper", "scissors"].sample

  if @user == @computer
    "It's a tie!"
  elsif (@user == "rock" && @computer == "scissors") 
        @result = "You win!"
  else
  "Computer wins!"
  end

  erb(:play_rock)
end

  get("/paper") do
    
  @user = "paper"
  @computer = ["rock", "paper", "scissors"].sample

  if @user == @computer
    "It's a tie!"
  elsif (@user == "paper" && @computer == "rock") 
   @result = "You win!"
  else
  "Computer wins!"
  end
  erb(:play_paper)

 end
get("/scissors") do

  @user = "scissors"
  @computer = ["rock", "paper", "scissors"].sample
  
  if @user == @computer
    "It's a tie!"
  elsif(@user == "scissors" && @computer == "paper")
   @result = "You win!"
  else
  "Computer wins!"
  end

  erb(:play_scissors)
end
