class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.string :name
      t.string :number
      t.timestamps null: false
    end
  end
end
