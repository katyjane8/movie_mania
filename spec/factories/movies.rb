FactoryBot.define do
  factory :movie do
    sequence(:title) {|n| "Mary Poppins #{n}"}
    description "Practicly perfect"
    director
  end
end
