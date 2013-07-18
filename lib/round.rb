# encoding: UTF-8

module PopQuiz
  class Round
    attr_reader :number, 
                :question, 
                :answers,
                :correct_answer

    def initialize(number)
      @number = number
      @question, @answers, @correct_answer = pick_question
    end

    def points
      2 ** (number-1) * 10
    end

    def time_left; end
    def completed?; end

    private
    def pick_question
      [ "What is Brazil's capitol?", [ "Rio de Janeiro", "São Paulo", "Brasília", "Buenos Aires" ], 2 ]
    end

  end
end