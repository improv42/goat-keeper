class Owner < ActiveRecord::Base
  has_many :dogs

  validates :first_name, :last_name, :phone, :email, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :phone, :alt_phone, length: { minimum: 10 }
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
