class AddStatusToPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :archived, :boolean
    add_column :posts, :status, :string, null: false, default: "draft"
  end
end
