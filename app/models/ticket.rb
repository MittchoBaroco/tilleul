class Ticket < ApplicationRecord
  def priority
    impact_number = TicketsHelper::IMPACTS[impact]
    urgency_number = TicketsHelper::URGENCIES[urgency]

    return (impact_number + urgency_number) - 1
  end
end
