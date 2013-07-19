require 'observer'

module PopQuiz
  class Player
    include Observable 

    attr_reader :id, :reader, :points

    def initialize(id)
      @id = id
      @eliminated = false
      @points = 0
    end

    def answer(index)
      changed
      notify_observers self, index
    end

    def add_points(points)
      @points += points
    end

    def eliminate!
      @eliminated = true
    end

    def eliminated?
      @eliminated == true
    end

    def alive?
      !eliminated?
    end

    def timeout; end
  end
end