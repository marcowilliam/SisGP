class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      redirect_to '/processos'
    else
      render "home"
    end
  end
end
