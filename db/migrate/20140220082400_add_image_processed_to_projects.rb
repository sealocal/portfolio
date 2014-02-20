class AddImageProcessedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :iamge_processed, :boolean
  end
end
