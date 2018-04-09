json.extract! student, :id, :name, :upc, :created_at, :updated_at
json.url student_url(student, format: :json)
