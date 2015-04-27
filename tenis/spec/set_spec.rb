require_relative 'spec_helper'

describe Set do

  let!(:set) { Set.new }

  describe "#value" do

    it "should raise exception" do
      expect{set.value}.to raise_exception SubclassResponsability
    end

  end

  describe "#next" do

    it "should raise exception" do
      expect{set.next}.to raise_exception SubclassResponsability
    end

  end

end

describe ZeroSets do

  let!(:set) { ZeroSets.new }

  describe "#value" do

    it "should be 0" do
      expect(set.value).to eq 0
    end

  end

  describe "#next" do

    it "should be OneSet" do
      expect(set.next).to be_instance_of OneSet
    end

  end

end

describe OneSet do

  let!(:set) { OneSet.new }

  describe "#value" do

    it "should be 1" do
      expect(set.value).to eq 1
    end

  end

  describe "#next" do

    it "should be TwoSets" do
      expect(set.next).to be_instance_of TwoSets
    end

  end

end

describe TwoSets do

  let!(:set) { TwoSets.new }

  describe "#value" do

    it "should be 2" do
      expect(set.value).to eq 2
    end

  end

  describe "#next" do

    it "should wins the match" do
      expect(set.next).to be_instance_of MatchFinished
    end

  end

end

describe MatchFinished do

  let!(:set) { MatchFinished.new }

  describe "#value" do

    it "should be finished" do
      expect(set.value).to eq "Match finished!"
    end

  end

  describe "#next" do

    it "should raise exception" do
      expect{set.next}.to raise_exception MatchFinishedException
    end

  end

end