class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :services
  has_many :candidates
  has_many :registerings, through: :candidates, source: :enterprise
  
  def register(enterprise)
    #binding.pry
    self.candidates.find_or_create_by(enterprise_id: enterprise.id)
  end
  
  def unregister(enterprise)
    candidate = self.candidates.find_by(enterprise_id: enterprise.id)
    candidate.destroy if candidate
  end
  
  def registering?(enterprise)
    self.registerings.include?(enterprise)
  end
end
