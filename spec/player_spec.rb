require_relative './spec_helper'

describe Player do 

  let(:player) { 
    game = PopQuiz.create_game
    game.add_player("john")
  }
  
  it "has an id" do
    player.id.should == "john"
  end

end
