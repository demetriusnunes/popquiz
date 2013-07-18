require_relative './player'
require_relative './round'

module PopQuiz
  class Game
    attr_reader :players, :eliminated, :rounds, :players_to_play

    def initialize
        @players = []
        @rounds = []
        @eliminated = []
    end

    def add_player(id)
        player = Player.new(id)
        @players << player
        player.answered.register self, :player_answered
        player
    end
    
    def started?
        rounds.size > 0
    end

    def next_round!
        @players_to_play = @players.dup
        @rounds << Round.new(@rounds.size + 1)
        @rounds.last
    end

    def round
        @rounds.last
    end

    def player_answered(player, answer)
        @players_to_play.delete player

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
