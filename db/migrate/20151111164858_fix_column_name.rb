class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :usuarios, :senha, :password
  end
end
