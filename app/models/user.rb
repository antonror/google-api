class User < ApplicationRecord
  devise        :database_authenticatable, :registerable, :recoverable,
                :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_google_oauth2(auth)
    unless User.find_by(email: auth.info.email)
      user = User.create(provider: auth.provider,
                                  uid:      auth.uid,
                                  email:    auth.info.email,
                                  picture:  auth.info.image,
                                  password: Devise.friendly_token[0,20])
    else
      user = User.find_by_email(auth.info.email)
    end
    user.update(access_token:   auth.credentials.token,
                        refresh_token:   auth.credentials.refresh_token)
    user
  end
end
