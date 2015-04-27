require_relative 'spec_helper'

describe Game do

  let!(:game) { Game.new }

  describe "#value" do

    it "should raise exception" do
      expect{game.value}.to raise_exception SubclassResponsability
    end

  end

  describe "#next" do

    it "should raise exception" do
      expect{game.next}.to raise_exception SubclassResponsability
    end

  end

end

describe ZeroGames do

  let!(:game) { ZeroGames.new }

  describe "#value" do

    it "should return zero" do
      expect(game.value).to eq 0
    end

  end

  describe "#next" do

    it "should be one Games" do
      expect(game.next).to be_instance_of OneGame
    end

  end

end

describe OneGame do

  let!(:game) { OneGame.new }

  describe "#value" do

    it "should return one" do
      expect(game.value).to eq 1
    end

  end

  describe "#next" do

    it "should be two Games" do
      expect(game.next).to be_instance_of TwoGames
    end

  end

end

describe TwoGames do

  let!(:game) { TwoGames.new }

  describe "#value" do

    it "should return 2" do
      expect(game.value).to eq 2
    end

  end

  describe "#next" do

    it "should be three Games" do
      expect(game.next).to be_instance_of ThreeGames
    end

  end

end

describe ThreeGames do

  let!(:game) { ThreeGames.new }

  describe "#value" do

    it "should return 3" do
      expect(game.value).to eq 3
    end

  end

  describe "#next" do

    it "should be four Games" do
      expect(game.next).to be_instance_of FourGames
    end

  end

end