class CreateTechnicians < ActiveRecord::Migration[5.1]
  def change
    create_table :technicians do |t|
      t.string :first_name
      t.string :last_name
      t.integer :support_level

      t.timestamps
    end
  end
end
