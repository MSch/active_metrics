class Article < ActiveRecord::Base
  belongs_to :channel
  belongs_to :client
end
