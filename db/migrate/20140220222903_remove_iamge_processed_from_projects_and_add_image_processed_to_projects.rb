class RemoveIamgeProcessedFromProjectsAndAddImageProcessedToProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :iamge_processed, :boolean
    add_column    :projects, :image_processed, :boolean
  end
end
