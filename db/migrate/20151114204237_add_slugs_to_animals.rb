class AddSlugsToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :slug, :string
      add_index :animals, :slug, unique: true
  end
end
