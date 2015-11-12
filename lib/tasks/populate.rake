namespace :db do

  desc "Clear the DB and fill with excellent sample data."

  task :populate => :environment do

    # Give it access to both populator and faker
    require 'populator'
    require 'faker'

    # Clear out every record inside these 3 tables
    [Dog, Owner, Vet].each(&:destroy_all)

    # Creates 5 new Vets
    Vet.populate 5 do |vet|
      vet.doctor = Faker::Name.name
      vet.clinic_name = Faker::Company.name
      vet.phone = Faker::PhoneNumber.cell_phone


     # Add fake information
      Owner.populate 20 do |owner|
        owner.first_name = Faker::Name.first_name
        owner.last_name = Faker::Name.last_name
        owner.phone = Faker::PhoneNumber.cell_phone
        owner.alt_phone = Faker::PhoneNumber.cell_phone
        owner.email = Faker::Internet.email
        owner.emergency_contact_name = Faker::Name.name
        owner.emergency_contact_phone = Faker::PhoneNumber.cell_phone
        owner.evac_waiver = true

        Dog.populate 1..7 do |dog|
          dog.name = Faker::Name.last_name
          dog.dob = Faker::Date.backward(5840)
          dog.breed_id = rand(1..16)
          dog.owner_id = owner.id
          dog.med_cond = Faker::App.name
          dog.vet_id = vet.id
        end # Dog
      end # Owner
    end # Vet
    puts "Heck YEAH!  Check that stuff out!"
  end
end