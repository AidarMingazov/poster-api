class CreateRating < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :point, null: false
      t.belongs_to :post, index: true, null: false
      t.belongs_to :user, index: true, null: false      
    end
  end
end
