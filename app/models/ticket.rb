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

    self.other_service = nil unless impacted_service == "Other"

    self.title.capitalize!
  end

  validates :title, presence: true
  validates :description, presence: true
  validates :requester_name, presence: true
  validates :requester_email, presence: true

  validates :status, presence: true,
                     inclusion: { in: TicketsHelper::STATUS }

  validates :impacted_service, presence: true,
                     inclusion: { in: TicketsHelper::SERVICES }

  validates :impact, presence: true,
                               inclusion: { in: TicketsHelper::IMPACTS }

  validates :urgency, presence: true,
                               inclusion: { in: TicketsHelper::URGENCIES }

  validates :level_support, presence: true,
                               inclusion: { in: TicketsHelper::SUPPORT_LEVELS }

  validates :departement, presence: true,
                               inclusion: { in: TicketsHelper::DEPARTEMENT }

  validates_format_of :requester_email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


  scope :assigned, -> (assignee) { open.where(assignee: assignee) }
  scope :open, -> { where(status: ["New", "Assigned", "In Progress"]) }
  scope :closed, -> { where(status: ["Invalid", "Resolved"]) }

  def priority
    impact_number = TicketsHelper::IMPACTS[impact]
    urgency_number = TicketsHelper::URGENCIES[urgency]

    return (impact_number + urgency_number) - 1
  end
end
