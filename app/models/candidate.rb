class Candidate < ApplicationRecord
  
  validates :memo, length: { maximum: 400 }
  
  belongs_to :user
  belongs_to :enterprise
  belongs_to :service, optional: true
end
