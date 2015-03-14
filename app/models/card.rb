class Card < ActiveRecord::Base
  self.inheritance_column =  'disabled'
  
  validates :word, presence: true, uniqueness: true, length: 2..50
  validates :difficulty, presence: true, :numericality => { greater_than_or_equal: 3, less_than: 5 }
  validates :type, presence: true, inclusion: %w{draw show talk}
end
