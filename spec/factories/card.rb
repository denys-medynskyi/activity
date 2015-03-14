# This will guess the User class
FactoryGirl.define do
  factory :card do
    sequence(:word) { |i| "word#{i}" }
    type 'talk'
    difficulty 3
  end
end
