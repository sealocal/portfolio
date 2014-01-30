class Comment < ActiveRecord::Base
  belongs_to :post

  def approve!
    approve = true
    save!
  end

  def approved?
    approved
  end
end
