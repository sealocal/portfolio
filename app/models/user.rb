class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def author?
    role == "author"
  end

  def editor?
    role == "editor"
  end
end
