namespace :spec do

  desc 'Run all specs in spec directory (exluding request/integration specs)'
  RSpec::Core::RakeTask.new(:norequests) do |task|
    file_list = FileList['spec/**/*_spec.rb']

    %w(requests).each do |exclude|
      file_list = file_list.exclude("spec/#{exclude}/**/*_spec.rb")
    end
    
    %w(internationalization).each do |exclude|
      file_list = file_list.exclude("spec/integration/#{exclude}_spec.rb")
    end

    task.pattern = file_list
  end

end
