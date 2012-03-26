class Company < ActiveRecord::Base
  has_many :records
  has_many :users
end
