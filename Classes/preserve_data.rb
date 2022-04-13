require 'json'

module PreserveData
  def persist_data(books, people, rentals)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_files(books, './data/books') unless books.empty?
    save_files(people, './data/people') unless people.empty?
    save_files(rentals, './data/rentals') unless rentals.empty?
  end

  def retrieve_data(path)
    read_file("./data/#{path}.json")
  end

  private

  def read_file(file_name)
    array = []
    return array unless File.exist?(file_name)

    File.foreach(file_name) do |line|
      line = line[0...-2] if line[-2] == ','
      array.push(line) if line.length > 2
    end
    array
  end


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
