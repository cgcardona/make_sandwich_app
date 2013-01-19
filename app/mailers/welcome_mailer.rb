class WelcomeMailer < ActionMailer::Base
  def send_sandwich_request(from, to, sandwichType, ingredients)
    @sandwich_type = sandwichType 
    @ingredients = ingredients
    mail( :from => from, :to => to + "<" + to + ">", :subject => "Favor Pleeese :-]") 
  end 
end
