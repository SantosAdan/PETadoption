class AddColumnsReviewToUser < ActiveRecord::Migration
  def change
      add_column :usuarios, :reviewed_id, :integer
      add_column :usuarios, :reviewer_id, :integer
  end
end
