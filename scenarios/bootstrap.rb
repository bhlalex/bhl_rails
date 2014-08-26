require Rails.root.join('spec', 'spec_helper.rb')


truncate_all_tables

# Insert some blank records in books to start downloading metadata from DAR
Volume.gen(:job_id => 239522, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofame51amer'))
Volume.gen(:job_id => 239523, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofuni601922unit'))
Volume.gen(:job_id => 239524, :book => Book.gen(:bibid => 'DAF-BHL:principlesofprof00germrich'))
Volume.gen(:job_id => 239525, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofame08amer'))
Volume.gen(:job_id => 239526, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsoflin27linn'))
Volume.gen(:job_id => 239527, :book => Book.gen(:bibid => 'DAF-BHL:postilla961966peab'))
Volume.gen(:job_id => 239528, :book => Book.gen(:bibid => 'DAF-BHL:polychlorinatedb00eisl'))
Volume.gen(:job_id => 239529, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofsec231koni'))
Volume.gen(:job_id => 239530, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofbat01bath'))
Volume.gen(:job_id => 239531, :book => Book.gen(:bibid => 'DAF-BHL:proceedingsofroy01lond'))
