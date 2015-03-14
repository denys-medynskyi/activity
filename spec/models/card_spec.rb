require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:word) }
  it { should validate_uniqueness_of(:word) }
  it { should ensure_length_of(:word).is_at_least(2).is_at_most(50) }
  it { should validate_presence_of(:difficulty) }
  it { should validate_numericality_of(:difficulty) }

end
