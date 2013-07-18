module PopQuiz
  class Player
    include Unobservable::Support

    attr_reader :id, :reader, :points

    attr_event :answered

    def initialize(id)
      @id = id
      @eliminated = false
      @points = 0
    end

    def answer(index)
      raise_event(:answered, self, index)
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