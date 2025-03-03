require 'csv'

class TriviaController < ApplicationController
  def index
    @trivias = TriviasService.fetch_trivias
    respond_to do |format|
      format.html
      format.json { render json: @trivias}
    end
  end

  def download_json
    trivias = TriviasService.fetch_trivias
    send_data JSON.pretty_generate(trivias),
              type: 'application/json',
              filename: 'trivias.json'
  end

  def download_csv
    trivias = TriviasService.fetch_trivias
    csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[Category Type Difficulty Question Correct_Answer]
      trivias.each do |trivia|
        csv << [trivia[:category], trivia[:type], trivia[:difficulty], trivia[:question], trivia[:correct_answer]]
      end
    end
    send_data csv_data, type: 'text/csv', filename: 'activities.csv'
  end
end