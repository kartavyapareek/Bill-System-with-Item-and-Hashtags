json.extract! bill, :id, :total_amount, :created_at, :updated_at
json.url bill_url(bill, format: :json)
