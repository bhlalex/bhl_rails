# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_book_history do
    user nil
    volume nil
    updated_at "2013-11-12 10:50:10"
  end
end
