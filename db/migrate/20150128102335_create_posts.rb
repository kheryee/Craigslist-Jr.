class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |x|
      x.string :title
      x.text :description
      x.string :name
      x.string :phone
      x.string :email
      x.references :category
      # x.belongs_to :category
      # x.integer :category_id

      x.timestamps
    end
  end
end
