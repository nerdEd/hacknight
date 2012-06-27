class SessionsController < ApplicationController
  def create
    # Do something with the fb hash
    hinfo = request.env['omniauth.auth']
    user_data = hinfo['extra']['raw_info']
    if h = Hacker.create(:email => user_data['email'], :name => user_data['first_name'])
      flash[:alert] = "Created a new user #{h.name}"
    end
    redirect_to root_path
  end
end
