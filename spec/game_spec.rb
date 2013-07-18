require_relative './spec_helper'

describe Game do 
  let(:game) { PopQuiz.create_game }

  it "adds players to the game" do
    player = game.add_player("john")
    player.should be_an_instance_of(Player)
    player.id.should == "john"
  end

  it "has a collection of players" do
    p1 = game.add_player("john")
    p2 = game.add_player("mary")
    p3 = game.add_player("paul")
    p4 = game.add_player("bill")
    game.players.size.should == 4
    game.players.should == [ p1, p2, p3, p4 ]
  end

  it "starts" do
    game.started?.should be_false
    game.next_round!
    game.started?.should be_true
  end

  it "has a current round, once started" do
    game.round.should == nil
    game.next_round!
    game.round.should be_an_instance_of(Round)
    game.round.should == game.rounds.last
  end

  it "generates new rounds" do
    game.rounds.size.should == 0
    game.next_round!
    game.rounds.size.should == 1
    game.next_round!
    game.rounds.size.should == 2
    game.next_round!
    game.rounds.size.should == 3
  end

  it "eliminates players with wrong answers" do
    p1 = game.add_player("john")

    game.next_round!

    p1.eliminated?.should be_false
    p1.answer(0)
    p1.eliminated?.should be_true
  end

  it "gives points to players who answer correctly" do
    p1 = game.add_player("john")

    game.next_round!

    p1.eliminated?.should be_false
    p1.points.should == 0
    p1.answer(2)
    p1.eliminated?.should be_false
    p1.points.should == 10
  end

end