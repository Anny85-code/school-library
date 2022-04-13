require 'json'

class PreserveData
  def persist_data(books, people, rentals)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_files(books, './data/books') unless books.empty?
    save_files(people, './data/people') unless people.empty?
    save_files(rentals, './data/rentals') unless rentals.empty?
  end

  private

  def save_files(items, file_name)
    File.write("#{file_name}.json", "[\n")
    File.open("#{file_name}.json", 'a') do |file|
      items.each_with_index do |item, index|
        if index < items.length - 1
          file.write "#{item},\n"
        else
          file.write "#{item}\n"
        end
      end
    end
    File.open("#{file_name}.json", 'a') { |file| file.write ']' }
  end
end
