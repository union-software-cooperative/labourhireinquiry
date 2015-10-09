json.array!(@people) do |person|
  json.extract! person, :id, :firstname, :lastname, :title, :address, :mobile, :fax, :email
  json.url person_url(person, format: :json)
end
