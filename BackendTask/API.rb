require 'net/http'
require 'json'
require 'csv'

class MusicTriviaUtility
  API_URL = 'https://opentdb.com/api.php?amount=1&category=12&difficulty=easy&type=boolean'

  def initialize(request_count, output_format)
    @request_count = request_count
    @output_format = output_format
    @data = []
  end

  def fetch_data
    @request_count.times do |i|
      response = Net::HTTP.get_response(URI(API_URL))
      if response.is_a?(Net::HTTPSuccess)
        @data << JSON.parse(response.body)
      else
        puts "Error : Request failed with code #{response.code} - #{response.message}"
      end
      
      sleep 5 if i < @request_count - 1  # Enforce rate limit (except after last request)
    end

    save_data
  end

  private

  def save_data
    case @output_format
    when 'json'
      File.write('music_trivia.json', JSON.pretty_generate(@data))
      puts "Data saved to music_trivia.json"
    when 'csv'
      CSV.open('music_trivia.csv', 'w') do |csv|
        csv << @data.first.keys
        @data.each { |activity| csv << activity.values }
      end
      puts "Data saved to music_trivia.csv"
    when 'console'
      puts JSON.pretty_generate(@data)
    else
      puts "Invalid format. Please choose 'json', 'csv', or 'console'."
    end
  end
end

puts "Enter the number of API calls:"
request_count = gets.chomp.to_i

puts "Enter output format (json/csv/console):"
output_format = gets.chomp.downcase

# Run utility
utility = MusicTriviaUtility.new(request_count, output_format)
utility.fetch_data
