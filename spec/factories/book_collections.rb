# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_collection do
    book nil
    collection nil
    order 1
  end
end
