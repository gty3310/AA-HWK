class CreateHouseTable < ActiveRecord::Migration[5.1]
  def change
    create_table :house_tables do |t|
      # t.string :name, null:false
      t.string :address
      # t.integer :people_id
      t.timestamps
    end
  end
end
