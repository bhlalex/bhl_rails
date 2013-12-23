require 'haml'
 
desc 'Tasks useful for internatiolization'
namespace :i18n do
  lang_dir = Rails.root.join("config", "locales")
  en_yml = File.join([lang_dir, "en.yml"])
 
  desc 'task to make sure all keys in en.yml file are used somewhere in the code'
  task :check_en_yml_not_used_keys do
 
    def load_yml_file(file_path)
      read_file = open(file_path)
      file_content = ''
      read_file.read.each_line do |line|
        if line.match(/^\s\s(\s*)([\w_?]*):\s/)
          file_content << line
         file_content << "\n"
        end
 
      end
      read_file.close
      return YAML.load(file_content)
    end
 
    def get_all_files_in_app
      Dir.chdir(Rails.root.join("app"))
      return Dir.glob(File.join("**", "*.{rb,haml,erb}"))
    end
 
    def get_keys(file_content)
      # returns array of keys in the file if any
      keys = Array.new
 
      temp_keys = file_content.split(/I18n.t(ranslate)*/)
 
      if (temp_keys.size==1)
        # no I18n keys in this file, return an empty array
        return keys
      else
        # ignore the first item in the array, from the second item, each will start with the key
        keys_count = 0
        for i in (1..temp_keys.size-1)
          if temp_keys[i].match (/^(\s*\()/) # matchs I18n.t(xxxx)
            if temp_keys[i].strip != '(' # to avoid error from nested I18n.t
              temp_str = temp_keys[i].strip.gsub('(','').strip.split(")")[0].split(",")[0]
              if (temp_str.index("\"") or temp_str.index("'") or temp_str.index(":"))
               keys[keys_count] = temp_str.strip.gsub("\"", "").gsub(":","").gsub("'","")
                keys_count = keys_count + 1
              end
            end
          elsif temp_keys[i].match(/^\s(\')/) # matchs I18n.t 'xxx'
            temp_str = temp_keys[i].strip[1..-1].split("'")[0] # trim then remove the first ' then split on the next ' and get the key
            keys[keys_count] = temp_str.strip
            keys_count = keys_count + 1
          elsif temp_keys[i].match(/^\s(\")/) # matchs I18n.t "xxx"
            temp_str = temp_keys[i].strip[1..-1].split('"')[0] # trim then remove the first " then split on the next " and get the key
            keys[keys_count] = temp_str.strip
            keys_count = keys_count + 1
          elsif temp_keys[i].match(/^\s(\:)/) # matchs I18n.t :xxx
            temp_str = temp_keys[i].strip[1..-1].split(/(,|\s|$|\Z)/)[0] # trim then remove the first : then split on the next comma, space, or a new line, end of line, or end of string
            keys[keys_count] = temp_str.strip
            keys_count = keys_count + 1
          end
        end
 
        return keys
      end
 
    end
 
    def drop_keys_from_yml_file(yml_container, keys)
      keys.each do |key|
        if (yml_container[key])
         yml_container.delete(key)
        end
      end
 
      return yml_container
    end
 
    en_yml_keys = load_yml_file(en_yml)
 
    all_files = get_all_files_in_app
 
    all_files.each do |file|
      file_open = open(file, "r")
      file_content = file_open.read
      file_open.close
 
      file_used_keys = get_keys(file_content)
      if file_used_keys.size > 0
        en_yml_keys = drop_keys_from_yml_file(en_yml_keys, file_used_keys)
      end
    end
 
    not_used_keys = ''
 
    en_yml_keys.each do |key, value|
      not_used_keys << "\n" if not_used_keys != ''
      not_used_keys << key.to_s
    end
 
    if (not_used_keys != '')
      puts not_used_keys.split("\n").count.to_s + ' keys are not used'
      not_used_keys.each_line do |key|
        puts key
      end
    else
      puts 'All keys in en.yml file are used'
    end
  end
end