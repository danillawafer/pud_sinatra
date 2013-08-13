require 'bcrypt'

class Player < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  include BCrypt

  def authenticate
    @player = User.find_by_email(params[:email])
    if @player.password == params[:password]
      session[:user_id] = @player.id
    else
      redirect '/sessions/new'
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
