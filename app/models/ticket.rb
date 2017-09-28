class Ticket < ApplicationRecord
  belongs_to :owner, class_name: 'Technician'
  belongs_to :assignee, class_name: 'Technician', optional: true
  belongs_to :resolver, class_name: 'Technician', optional: true

  before_save do
    self.assigned_at = DateTime.now if self.assignee_id_changed?
    if self.resolver_id_changed?
      self.resolved_at = DateTime.now
      self.status = "Resolved"
    end
  end

  scope :assigned, -> (assignee) { open.where(assignee: assignee) }
  scope :open, -> { where(status: ["New", "Assigned", "In Progress"]) }
  scope :closed, -> { where(status: ["Invalid", "Resolved"]) }

  def priority
    impact_number = TicketsHelper::IMPACTS[impact]
    urgency_number = TicketsHelper::URGENCIES[urgency]

    return (impact_number + urgency_number) - 1
  end
end
