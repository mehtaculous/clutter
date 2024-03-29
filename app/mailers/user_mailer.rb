class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Cluster")
  end

  def referral_email(from, to)
    @user = from
    @referral_name = to[:name]
    mail(to: to[:email], subject: "You have been referred by #{@user.name}")
  end

  def first_session_email(user)
    @user = user
    mail(to: @user.email, subject: "Reminder: Your first session with Cluster is right around the corner")
  end

  def second_session_email(user)
    @user = user
    mail(to: @user.email, subject: "Reminder: Your next session with Cluster is right around the corner")
  end

  def third_session_email(user)
    @user = user
    mail(to: @user.email, subject: "Reminder: Your next session with Cluster is right around the corner")
  end
end