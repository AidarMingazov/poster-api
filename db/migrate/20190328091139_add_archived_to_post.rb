class AddArchivedToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :archived, :boolean, null: false, default: false
  end
end
