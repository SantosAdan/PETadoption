class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :specie

      t.timestamps null: false
    end
  end
end

