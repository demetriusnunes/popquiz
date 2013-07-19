require 'active_support/time'
require_relative './game'

module PopQuiz

  def self.create_game(options = {})
    PopQuiz::Game.new
  end

end
