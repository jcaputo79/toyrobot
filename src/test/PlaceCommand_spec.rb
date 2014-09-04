require 'minitest/spec'
require_relative '../main/Command/PlaceCommand.rb'
require_relative '../main/domain/ToyRobot.rb'

describe PlaceCommand do

  before(:each) do
    @toyRobot = ToyRobot.new
  end

  after(:each) do
    @toyRobot = nil
  end

  it "returns a valid PlaceCommand instance when it gets a valid Place command string" do
    expect(PlaceCommand.new("PLACE 1, 1, South")).to be_a PlaceCommand
  end

  it "raises an ArgumentError when passed an invalid Place command string" do
    expect { PlaceCommand.new("PLACE 1 1 SomeWeirdDirection") }.to raise_error ArgumentError
  end

  it "doesn't raise an error when executing the place command" do
    placeCommand = PlaceCommand.new("PLACE 1, 1, South")
    expect(placeCommand.execute(@toyRobot)).to eq true
  end

  it "doesn't raise an error when executing the place command" do
    expect { PlaceCommand.new("INVALID 0,0,NORTH") }.to raise_error ArgumentError
  end
end