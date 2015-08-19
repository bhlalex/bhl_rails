namespace :languages_table_cleaner do
  desc 'Remove invalid rows from languages table'
  task :clean_languages_table=> :environment do
    clean_languages_table
  end
  
  def clean_languages_table
    Language.find_each do |language|
      languages_codes_array = language.code.scan(/.{3}/)
      books = Book.where(language_id: language.id)
      languages_codes_array.each do |code|
        lang = Language.find_or_create_by_code(code)
        books.each do |book|
          BookLanguage.create(book_id: book.id, language_id: lang.id)
        end
      end
      # remove invalid languages
      language.destroy if languages_codes_array.count > 1
    end
  end
end