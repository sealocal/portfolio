class Comment < ActiveRecord::Base
  belongs_to :post

  def approve!
    approved = true
    save!
  end

  def approved?
    approved
  end
end
