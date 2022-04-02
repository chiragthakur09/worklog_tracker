json.extract! worklog, :id, :user_id, :date, :hours, :notes, :created_at, :updated_at
json.url worklog_url(worklog, format: :json)
