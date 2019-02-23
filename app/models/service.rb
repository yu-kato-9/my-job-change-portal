class Service < ApplicationRecord
  enum kind: [:転職サイト, :転職エージェント]
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :kind, presence: true, inclusion: { in: Service.kinds.keys }
  validates :memo, length: { maximum: 400 }
  validates :name_of_person_in_charge, allow_blank: true, length: { maximum: 50 }
  validates :tel_of_person_in_charge, allow_blank: true, format: {with: /\A\d{10}$|^\d{11}\z/ }
  validates :email_of_person_in_charge, allow_blank: true, length: { maximum: 255 },
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  belongs_to :user
  
  has_many :candidates
end
