require 'tty-prompt'
require 'csv'
require 'console_table'
require 'pry'
require 'terminal-table'


# Class responsible for fetching CSV files from a directory
class FileFetcher
  def initialize(directory)
    @directory = directory
  end

  def fetch_csv_files
    Dir.glob(File.join(@directory, '*.csv'))
  end
end

# Class responsible for displaying the list of files and selecting one
class FileSelector
  def initialize(files)
    @files = files
    @prompt = TTY::Prompt.new
  end

  def select_file
    @prompt.select('Choose a CSV file to display:', @files)
  end
end

# Class responsible for reading and processing the CSV file
class CsvReader
  def initialize(file)
    @file = file
  end

  def read_and_parse
    data = []
    CSV.foreach(@file, headers: true) do |row|
      data << row.to_hash
    end
    data
  end
end

# Class responsible for displaying the CSV content in a table format
class CsvDisplayer
  def initialize(data)
    @data = data
  end

  def display_table
    headers = @data.first.keys
    rows = @data.map(&:values)

    table = Terminal::Table.new(headings: headers, rows: rows)
    puts table
  end
end

# Main program flow
class CsvApp
  def initialize(directory)
    @directory = directory
  end

  def run
    files = FileFetcher.new(@directory).fetch_csv_files
    if files.empty?
      puts 'No CSV files found in the specified directory.'
      return
    end

    selected_file = FileSelector.new(files).select_file
    csv_data = CsvReader.new(selected_file).read_and_parse
    CsvDisplayer.new(csv_data).display_table
  end
end

directory_path = './csv_files'  
CsvApp.new(directory_path).run
