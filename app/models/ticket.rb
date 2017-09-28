class Ticket < ApplicationRecord
  belongs_to :owner, class_name: 'Technician'
  has_one :assignee, class_name: 'Technician'
  has_one :resolver, class_name: 'Technician'
  
  def priority
    impact_number = TicketsHelper::IMPACTS[impact]
    urgency_number = TicketsHelper::URGENCIES[urgency]

    return (impact_number + urgency_number) - 1
  end
end
