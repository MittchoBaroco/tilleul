class AddOwnerAndAssigneeToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :owner_id, :integer
    add_column :tickets, :assignee_id, :integer
    add_column :tickets, :resolver_id, :integer

    add_index :tickets, :owner_id
    add_index :tickets, :assignee_id
    add_index :tickets, :resolver_id
  end
end
