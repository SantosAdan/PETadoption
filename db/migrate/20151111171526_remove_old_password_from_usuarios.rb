class RemoveOldPasswordFromUsuarios < ActiveRecord::Migration
  def up
  	remove_column :usuarios, :password
  end

  def down
  	add_column :usuarios, :password
  end
end
