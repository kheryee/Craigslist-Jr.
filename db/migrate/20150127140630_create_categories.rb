class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |x|
      x.string :name
      x.timestamps
    end
  end
end