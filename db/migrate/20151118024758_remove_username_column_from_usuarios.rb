class RemoveUsernameColumnFromUsuarios < ActiveRecord::Migration
  def change
      remove_column :usuarios, :username
  end
end
