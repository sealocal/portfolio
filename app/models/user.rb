class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def author?
    role == "author"
  end

  def editor?
    role == "editor"
  end

  def admin?
    role == "admin"
  end

  def twitter_user?
    role == "twitter_user"
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      #user.name = user.username
      user.name = auth.info.nickname
      user.email = "#{user.name}-CHANGEME@twitter.example.com"
      user.role = "twitter_user"
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
