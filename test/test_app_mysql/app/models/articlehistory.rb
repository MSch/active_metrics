class Articlehistory < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :channel
end
