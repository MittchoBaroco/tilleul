module TicketsHelper
  STATUS = ["New", "Assigned", "In Progress", "Resolved",]
  SERVICES = ["Internet", "Mail", "Work Station", "Phones", "Printer", "Other"]
  IMPACTS = %w(Critical Sigificant Moderate Minor)
  URGENCIES = %w(Urgent Hight Medium Low)
  SUPPORT_LEVELS = [1,2,3]
end
