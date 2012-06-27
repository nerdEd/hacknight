class HackersController < ApplicationController
  def index
    @hackers = Hacker.all
  end

  def create
    params[:hacker][:name] = "Email Hacker -- #{Time.now.to_i}"
    if h = Hacker.create(params[:hacker])
      flash[:alert] = "New hacker with email #{h.email} created"
      HackerMailer.welcome_email(h).deliver
      redirect_to hackers_path
    else
      # do some error handling
    end
  end
end
