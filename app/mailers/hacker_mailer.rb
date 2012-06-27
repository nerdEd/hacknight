class HackerMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(hacker)
    @hacker = hacker
    mail(:to => hacker.email, :subject => "Welcome to the hacknight!")
  end
end
