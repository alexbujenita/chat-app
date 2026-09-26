class CreateInitialSchema < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.integer :age
      t.string :email
      t.string :password_digest
      t.timestamps
      t.boolean :admin, default: false
    end

    create_table :groups do |t|
      t.string :name
      t.timestamps
      t.integer :owner_id
    end

    create_table :members do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end

    create_table :messages do |t|
      t.integer :user_id
      t.integer :group_id
      t.text :content
      t.timestamps
    end
  end
end
