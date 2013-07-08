require 'factory_girl_rails'

FactoryGirl.define do
  
  sequence(:string)     { |n| "unique#{ n }string" }
  
  factory :author do
    name                { generate(:string) }
  end
  
  factory :book do
    association         :language         
    bibid               { generate(:string) }
    #title               { generate(:string) }
    #start_date          { Time.now }
    #end_date            { Time.now }
    #publisher           { generate(:string) }
    #note                { generate(:string) }
    #edition             { generate(:string) }
    #format_extent       { generate(:string) }
    #collection          { generate(:string) }
    #contributor         { generate(:string) }    
  end
  
  factory :language do
    code                { generate(:string) }
    name                { generate(:string) }
  end
  
  factory :name do
    string                { generate(:string) }    
  end
  
  factory :user do
    username            { generate(:string) }
    password            { generate(:string) }
    real_name           { generate(:string) }
    email               { generate(:string) }
    guid                { generate(:string) }    
  end
  
  factory :volume do
    association         :book
    job_id              :integer
  end
end