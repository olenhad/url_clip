json.array!(@accesses) do |access|
  json.extract! access, :id, :url_id, :access_time, :ip_addr
  json.url access_url(access, format: :json)
end
