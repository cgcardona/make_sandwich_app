class WelcomeController < ApplicationController
  def index
  end

  def post
    @prm = params
    @ingredients = params[:meatIngredients] ? params[:meatIngredients] : nil
    @ingredients = @ingredients ? @ingredients : params[:veggieIngredients]
    @ingredients = @ingredients ? @ingredients : params[:veganIngredients]

    if true 
      WelcomeMailer.send_sandwich_request('m4kesandwich@gmail.com', 'cgcardona@gmail.com', params[:sandwichType], @ingredients).deliver
      flash[:notice] = 'Your sandwich is on the way!'
      redirect_to :action => 'index'
      return
    else
      flash[:error] = 'You must give a name'
      redirect_to :action => 'index'
      return
    end
  end
end
