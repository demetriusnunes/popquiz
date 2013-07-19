require_relative '../spec_helper'

describe PopQuiz do
  it "creates a game" do
    PopQuiz.create_game.should be_an_instance_of(Game)
  end
end