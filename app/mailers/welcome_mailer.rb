class WelcomeMailer < ActionMailer::Base
  def send_sandwich_request(from, to, sandwichType, ingredients, quote)
    @sandwich_type = sandwichType 
    @ingredients   = ingredients
    @quote         = quote
    mail( :from => from, :to => to + "<" + to + ">", :subject => "Favor Pleeese :-]") 
  end 
end
