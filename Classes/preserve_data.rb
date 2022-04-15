require 'json'

module PreserveData
  def persist_data(books, people, rentals)
    Dir.mkdir('./data') unless Dir.exist?('./data')
    save_files(books, './data/books') unless books.empty?
    save_files(people, './data/people') unless people.empty?
    save_files(rentals, './data/rentals') unless rentals.empty?
  end

  def retrieve_data(path)
    return [] unless File.exist?("./data/#{path}.json")

    read_file("./data/#{path}.json")
  end

  private

  def read_file(file_name)
    file_data = File.read(file_name)
    JSON.parse(file_data, create_additions: true)
  end

  def save_files(items, file_name)
    File.write("#{file_name}.json", JSON[items])
  end
end
