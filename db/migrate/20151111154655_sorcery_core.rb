class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.integer :login_count, default: 0, null: false
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
