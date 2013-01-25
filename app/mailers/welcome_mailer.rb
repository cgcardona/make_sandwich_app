class WelcomeMailer < ActionMailer::Base
  def send_sandwich_request(requestor, to, sandwichType, ingredients, quote)
    @requestor     = requestor
    @sandwich_type = sandwichType 
    @ingredients   = ingredients
    @quote         = quote
    mail( :from => "m4k3sandwich@gmail.com", :to => to + "<" + to + ">", :subject => "Favor Pleeese :-]") 
  end 
end
