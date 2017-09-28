class AddTimeTrackerToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :assigned_at, :datetime
    add_column :tickets, :resolved_at, :datetime
  end
end
