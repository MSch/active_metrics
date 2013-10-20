class Group < ActiveRecord::Base
  has_many :clients
  has_and_belongs_to_many :users
end
