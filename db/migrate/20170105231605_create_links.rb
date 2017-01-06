class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url
      t.integer :clicks, :default => 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
