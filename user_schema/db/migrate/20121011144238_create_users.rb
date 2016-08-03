class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name 
      t.string :last_name
      t.string :gender
      t.string :email 
      t.string :phone
      t.date :birthday
      t.datetime :created_at, :updated_at

      # Agrega aquí las columnas que faltan

      t.timestamps
    end
  end
end

