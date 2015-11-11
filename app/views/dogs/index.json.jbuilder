json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :dob, :breed_id, :owner_id, :med_cond, :vet_id
  json.url dog_url(dog, format: :json)
end
