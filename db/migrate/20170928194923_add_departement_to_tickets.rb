class AddDepartementToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :departement, :string
    add_column :tickets, :other_service, :string
  end
end
