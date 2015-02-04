class Yogurt < ActiveRecord::Base

  validates :flavor, presence: true
  validates :flavor, length: {maximum: 30}

  validates :topping, presence: true
  validates :topping, length: {maximum: 30}
  
  validates :quantity, presence: true 
  validates :quantity, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 12} # ounces
  
  # validates_presence_of :flavor, :topping, :quantity
  # validates_numericality_of :quantity, greater_than: 0, less_than_or_equal_to: 12 # ounces

end
