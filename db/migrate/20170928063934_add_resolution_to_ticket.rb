class AddResolutionToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :resolution, :text
  end
end
