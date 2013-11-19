# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
    title "MyString"
    description "MyString"
    status false
    last_modified_date "2013-11-18 10:08:45"
    creation_date "2013-11-18 10:08:45"
  end
end
