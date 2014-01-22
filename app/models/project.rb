class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { minimum: 3}
end
