class CreateTableReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
        t.belongs_to :reviewer
        t.belongs_to :reviewed
        t.integer :points
        
        t.index [:reviewer_id, :reviewed_id], unique: true 

      t.timestamps null: false
    end
  end
end
