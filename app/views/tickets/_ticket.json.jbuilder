json.extract! ticket, :id, :title, :owner, :status, :requester_name, :requester_email, :requester_phone, :requester_details, :description, :impact, :urgency, :technician_actions, :level_support, :impacted_service, :resolution, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
