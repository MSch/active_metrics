class Ticket < ActiveRecord::Base
  belongs_to :channel
  belongs_to :clients
end
