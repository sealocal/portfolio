class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { minimum: 2, message: "Really? Your name is less than 2 chars?"}
end
