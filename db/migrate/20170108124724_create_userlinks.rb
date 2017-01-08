class CreateUserlinks < ActiveRecord::Migration
  def change
    create_table :userlinks do |t|
      t.string :url
      t.belongs_to :link, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
