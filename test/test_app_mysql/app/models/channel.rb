class Channel < ActiveRecord::Base
  has_many :articles
  has_and_belongs_to_many :clients
end
