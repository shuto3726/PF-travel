class HomesController < ApplicationController

  def top
  end
  
  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.passeord = SecureRandom.urlsafe_base
  end
  
end
