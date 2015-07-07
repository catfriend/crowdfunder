class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :team_leader, :string
    add_column :projects, :image_file_name, :string
  end
end
