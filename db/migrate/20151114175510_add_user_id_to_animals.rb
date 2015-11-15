class AddUserIdToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :usuario, index: true, foreign_key: true
  end
end

