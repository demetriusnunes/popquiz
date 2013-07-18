require_relative './spec_helper'

describe Round do 
  let(:round) { PopQuiz.create_game.next_round! }

  it "has a question" do
    round.question.should be_an_instance_of(String)
    round.question.should_not be_empty
  end

  it "has 4 possible answers" do
    round.answers.size.should == 4
    round.answers[0].should be_an_instance_of(String)
    round.answers[1].should be_an_instance_of(String)
    round.answers[2].should be_an_instance_of(String)
    round.answers[3].should be_an_instance_of(String)
  end

  it "has a correct answer" do
    round.correct_answer.should be >= 0
    round.correct_answer.should be <= 3
  end

  it "is worth 10 points" do
    round.points.should == 10
  end

end
