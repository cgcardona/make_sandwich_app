class WelcomeController < ApplicationController
  def index
  end

  def post
    @prm = params
    @ingredients = params[:meatIngredients] ? params[:meatIngredients] : nil
    @ingredients = @ingredients ? @ingredients : params[:veggieIngredients]
    @ingredients = @ingredients ? @ingredients : params[:veganIngredients]

    if @ingredients.nil?
      flash[:error] = 'Please pick at least 1 ingredient.'
      redirect_to :action => 'index'
      return
    end 

    if params[:receiver].empty? && params[:sender].empty?
      flash[:error] = 'Please enter an email address for both the sender and receiver.'
      redirect_to :action => 'index'
      return
    end

    WelcomeMailer.send_sandwich_request(params[:sender], params[:receiver], params[:sandwichType], @ingredients).deliver
    flash[:notice] = 'Your sandwich is on the way!'
    redirect_to :action => 'index'
    return
  end
end
