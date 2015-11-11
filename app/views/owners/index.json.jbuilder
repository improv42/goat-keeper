json.array!(@owners) do |owner|
  json.extract! owner, :id, :first_name, :last_name, :phone, :alt_phone, :email, :emergency_contact_name, :emergency_contact_phone, :evac_waiver
  json.url owner_url(owner, format: :json)
end
