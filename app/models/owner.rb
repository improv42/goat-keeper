class Owner < ActiveRecord::Base
  has_many :dogs

  validates :first_name, :last_name, :phone, :email, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :phone, :alt_phone, length: { minimum: 10 }

  # Normalizes the attribute itself before validation
  phony_normalize :phone, :alt_phone, :emergency_contact_phone, default_country_code: 'US'

  def sort_name
    "#{last_name}, #{first_name}"
  end

  def display_name
    "#{first_name} #{last_name}"
  end

end

# == Schema Information
#
# Table name: owners
#
#  id                      :integer          not null, primary key
#  first_name              :string
#  last_name               :string
#  phone                   :string
#  alt_phone               :string
#  email                   :string
#  emergency_contact_name  :string
#  emergency_contact_phone :string
#  evac_waiver             :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
