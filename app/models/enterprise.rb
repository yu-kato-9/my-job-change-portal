class Enterprise < ApplicationRecord
  
  def self.search(keyword)
    if keyword
      Enterprise.where(['name LIKE ?', "%#{keyword}%"])
    else
      Enterprise.all
    end
  end
  
  has_many :users
end
