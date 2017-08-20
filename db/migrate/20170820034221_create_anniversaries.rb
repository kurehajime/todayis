class CreateAnniversaries < ActiveRecord::Migration[5.1]
  def change
    create_table :anniversaries do |t|
      t.string :name
      t.date :date
      t.string :description
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end
  end
end
