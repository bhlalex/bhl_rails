namespace :bhl do
  desc 'Update empty BibTex and EndNote'
  task :update_empty_bibtext_endnote => :environment do
    books = Book.where("mods is not null and (bibtex is null or endnote is null)")
    file_location = File.join(Rails.root, "tmp", "mods.xml")
    bibtex_file_location = File.join(Rails.root, "tmp", "file.bibtex")
    endnote_file_location = File.join(Rails.root, "tmp", "file.end")
    
    puts "Updating #{books.count} books"
    total_books = books.count
    
    iter_variable = 1
    
    books.each do |book|
      puts "#{iter_variable} / #{total_books}: BIBID => #{book.bibid}"
      iter_variable += 1
      File.delete(file_location) if File.exist?(file_location)
      File.delete(bibtex_file_location) if File.exist?(bibtex_file_location)
      File.delete(endnote_file_location) if File.exist?(endnote_file_location)
      open(file_location, 'w') do |file| 
        file.write book.mods
      end
      
      # generate bibtex
      system "xml2bib #{file_location} > #{bibtex_file_location}"
      bibtex = File.read(bibtex_file_location)
      bibtex = bibtex[1..-1] if bibtex[0] == "?"
      book.bibtex = bibtex unless bibtex.empty?
      
      #generate endnote
      system "xml2end #{file_location} > #{endnote_file_location}"
      endnote = File.read(endnote_file_location)
      endnote = endnote[1..-1] if endnote[0] == "?"
      book.endnote = endnote unless endnote.empty?
      
      book.save
    end
  end
end