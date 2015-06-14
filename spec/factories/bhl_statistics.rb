# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bhl_statistic do
    books_count 1
    authors_count 1
    species_count 1
  end
end
