class Vet < ActiveRecord::Base
  has_many :dogs

  validates :doctor, :clinic_name, :phone, presence: true
  validates :doctor, :clinic_name, length: { minimum: 2 }
  validates :phone, length: { minimum: 10 }

  # Normalizes the attribute itself before validation
  phony_normalize :phone, default_country_code: 'US'
end

# == Schema Information
#
# Table name: vets
#
#  id          :integer          not null, primary key
#  doctor      :string
#  clinic_name :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
