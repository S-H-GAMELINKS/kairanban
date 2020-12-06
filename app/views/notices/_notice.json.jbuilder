json.extract! notice, :id, :title, :auther, :greet, :content, :created_at, :updated_at
json.url notice_url(notice, format: :json)
