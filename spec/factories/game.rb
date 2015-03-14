# This will guess the User class
FactoryGirl.define do
  factory :game do
    teams { [{name: 'Sharks', players: ['Den', 'Joe'], current_player: 0}, name: 'Tankers', players: ['Tank', 'Boris'], current_player: 0] }
  end
end
