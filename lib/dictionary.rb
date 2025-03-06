# Opens and provides access to txt document

module Dictionary
  def dictionary_array
    dictionary_array = []
    File.open('google-10000-english-no-swears.txt', 'r') do |file|
      file.each_line do |line|
        dictionary_array << line.strip 
      end
    end
    dictionary_array
  end
end