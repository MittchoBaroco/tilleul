class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :owner
      t.string :status
      t.string :requester_name
      t.string :requester_email
      t.string :requester_phone
      t.string :requester_details
      t.text :description
      t.string :impact
      t.string :urgency
      t.text :technician_actions
      t.integer :level_support
      t.string :impacted_service

      t.timestamps
    end
  end
end
