# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_message do
    name "MyString"
    email "MyString"
    subject "MyString"
    message "MyString"
  end
end
