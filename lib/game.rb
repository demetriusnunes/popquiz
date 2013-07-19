require_relative './player'
require_relative './round'
require 'securerandom'

module PopQuiz
  class Game
    attr_reader :id,
                :players, 
                :eliminated, 
                :rounds, 
                :players_to_play

    def initialize
        @id = SecureRandom.uuid
        @players = []
        @rounds = []
        @eliminated = []
    end

    def add_player(id)
        player = Player.new(id)
        player.add_observer(self, :player_answered)
        @players << player
        player
    end
    
    def started?
        rounds.size > 0
    end

    def next_round!
        @rounds << Round.new(@rounds.size + 1)
        @players_to_play = @players.dup
        @rounds.last
    end

    def round
        @rounds.last
    end

    def player_answered(player, answer)
        @players_to_play.delete player
        round.completed! if @players_to_play.empty?

        if (round.correct_answer == answer)
            player.add_points(round.points)
        else
            player.eliminate! 
            eliminated << player 
            players.delete player
        end
    end

    def notify_players; end
    def scoreboard; end
    def completed?; end
    def winner; end
  end
end
