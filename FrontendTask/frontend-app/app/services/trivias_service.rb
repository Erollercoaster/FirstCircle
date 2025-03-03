require 'net/http'
require 'json'

class TriviasService
  API_URL = 'https://opentdb.com/api.php?amount=15&category=12&difficulty=easy&type=boolean'

  def self.fetch_trivias
    response = Net::HTTP.get_response(URI(API_URL))

    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)

      data["results"].map do |question|
        {
          category: question["category"],
          type: question["type"],
          difficulty: question["difficulty"],
          question: question["question"],
          correct_answer: question["correct_answer"]
        }
      end
    else
      puts "Error: Request failed with code #{response.code} - #{response.message}"
      []
    end
  end
end