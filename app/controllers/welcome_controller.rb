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

    if params[:receiver].empty? && params[:requestor].empty?
      flash[:error] = 'Please enter an email address for both the receiver and requestor.'
      redirect_to :action => 'index'
      return
    end

    quote = ['May the Force be with you', 'Live long and prosper', 'Be excellent to each other'].sample

    WelcomeMailer.send_sandwich_request(params[:requestor], params[:receiver], params[:sandwichType], @ingredients, quote).deliver
    flash[:notice] = 'Your sandwich is on the way!'
    redirect_to :action => 'success'
    return
  end

  def success
  end
end
