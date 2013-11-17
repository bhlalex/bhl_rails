require 'factory_girl_rails'

FactoryGirl.define do
  
  sequence(:string)     { |n| "unique#{ n }string" }
  
  sequence(:email) do |n|
    "person#{n}@example.com"
  end
  
  factory :author do
    name                { generate(:string) }
  end
  
  factory :book do
    association         :language         
    bibid               { generate(:string) }
    title               { generate(:string) }
    mods                { generate(:string) }
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
    email                     { generate(:email) }
    username                  do
      attempt = generate(:string).downcase
      while(User.find_by_username(attempt)) do
        attempt.succ!
      end
      attempt
    end
    active                    false
    password                  'test password'
    entered_password          'test password'
    real_name                 { generate(:string) }
    guid                      do
      attempt = generate(:string).downcase
      while(User.find_by_guid(attempt)) do
        attempt.succ!
      end
      attempt
    end
  end
  
  factory :volume do
    association         :book #Was bookbook and changed to book Youstina 11/11/2013
    job_id              :integer
  end

  factory :page do
    association        :volume
  end
  
  
  factory :page_name do
    association         :page
    association         :name
    namestring          generate(:string) 
  end
end