json.array!(@recs) do |rec|
  json.extract! rec, :id, :name, :tags, :start_date, :end_date, :attachment, :coverage, :product_service, :union, :company, :local_union_contact, :national_union_contact
  json.url rec_url(rec, format: :json)
end
