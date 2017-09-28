module TicketsHelper
  STATUS = ["New", "Assigned", "In Progress", "Invalid", "Resolved",]
  SERVICES = ["Internet", "Mail", "Work Station", "Phones", "Printer", "Other",]
  IMPACTS = { "Critical" => 1, "Sigificant" => 2, "Moderate" => 3, "Minor" => 4 }
  URGENCIES = {"Urgent" => 1, "High" => 2, "Medium" => 3, "Low" => 4}
  SUPPORT_LEVELS = [1,2,3]
  DEPARTEMENT = ['Finance', 'IT', 'Marketing']
end
