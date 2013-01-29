class Warrior < ActiveRecord::Base
  string :name
  has_one :experience
  has_many :weapons
end
