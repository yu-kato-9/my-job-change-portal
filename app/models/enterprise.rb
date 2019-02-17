class Enterprise < ApplicationRecord
  
  def self.search(keyword)
    if keyword
      Enterprise.where(['name LIKE ?', "%#{keyword}%"])
    end
  end
    
end
