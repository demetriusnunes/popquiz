require 'active_support/time'
require 'unobservable'
require_relative './game'

module PopQuiz

  def self.create_game(options = {})
    PopQuiz::Game.new
  end

end
