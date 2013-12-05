# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyString"
    volume_id 1
    collection_id 1
    comment_id 1
    user_id 1
    number_of_marks 1
  end
end
