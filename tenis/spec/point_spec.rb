require_relative 'spec_helper'

describe Point do

  let!(:point) { Point.new }

  describe "#value" do

    it "should raise exception" do
      expect{point.value}.to raise_exception SubclassResponsability
    end

  end

  describe "#next" do

    it "should raise exception" do
      expect{point.next}.to raise_exception SubclassResponsability
    end

  end

end

describe ZeroPoints do

  let!(:point) { ZeroPoints.new }

  describe "#value" do

    it "should return zero" do
      expect(point.value).to eq 0
    end

  end

  describe "#next" do

    it "should be fifteen points" do
      expect(point.next).to be_instance_of FifteenPoints
    end

  end

end

describe FifteenPoints do

  let!(:point) { FifteenPoints.new }

  describe "#value" do

    it "should return fifteen" do
      expect(point.value).to eq 15
    end

  end

  describe "#next" do

    it "should be thirty points" do
      expect(point.next).to be_instance_of ThirtyPoints
    end

  end

end

describe ThirtyPoints do

  let!(:point) { ThirtyPoints.new }

  describe "#value" do

    it "should return 30" do
      expect(point.value).to eq 30
    end

  end

  describe "#next" do

    it "should be forty points" do
      expect(point.next).to be_instance_of FortyPoints
    end

  end

end

describe FortyPoints do

  let!(:point) { FortyPoints.new }

  describe "#value" do

    it "should return 40" do
      expect(point.value).to eq 40
    end

  end

  describe "#next" do

    it "should be zero points" do
      expect(point.next).to be_instance_of ZeroPoints
    end

  end

end

describe Advantage do

  let!(:a_score) { TennisScoreTest.new FortyPoints.new  }
  let!(:a_player) { TestPlayer.new "a_player", a_score }

  let!(:point) { Advantage.new_for a_player }

  describe "#value" do

    it "should return Advantage for player" do
      expect(point.value).to eq "Advantage for a_player"
    end

  end

  describe "#next" do

    it "should be zero points" do
      expect(point.next).to be_instance_of ZeroPoints
    end

  end

end