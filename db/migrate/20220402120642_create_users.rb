class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.float :work_hours_per_day

      t.timestamps
    end
  end
end
