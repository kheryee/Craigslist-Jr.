require 'faker'


class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |x|
      x.string :title
      x.text :description
      x.string :name
      x.string :phone
      x.string :email
      x.belongs_to :category

      x.timestamps
    end
  end
end