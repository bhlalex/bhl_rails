# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :harvest_event_book do
    harvest_event nil
    book nil
    success false
  end
end
