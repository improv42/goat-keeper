class Dog < ActiveRecord::Base
  belongs_to :breed
  belongs_to :owner
  belongs_to :vet

  validates :name, :dob, :breed_id, :owner_id, :vet_id, presence: true
  validates :name, length: { minimum: 2 }
end

# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :date
#  breed_id   :integer
#  owner_id   :integer
#  med_cond   :string
#  vet_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_dogs_on_breed_id  (breed_id)
#  index_dogs_on_owner_id  (owner_id)
#  index_dogs_on_vet_id    (vet_id)
#
