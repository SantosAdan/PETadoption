class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :idade
      t.string :sexo
      t.string :email
      t.string :perfil
      t.string :endereco
      t.string :telefone
      t.string :username
      t.string :senha

      t.index :email, unique: true

      t.timestamps null: false
    end
  end
end
