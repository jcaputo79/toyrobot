require 'minitest/spec'
require_relative '../main/command/MoveCommand.rb'
require_relative '../main/domain/ToyRobot.rb'
require_relative '../main/exception/ToyRobotExceptions.rb'
require_relative '../main/command/PlaceCommand.rb'

describe MoveCommand do

  before(:each) do
    @toyRobot = ToyRobot.new
    @moveCommand = MoveCommand.new("Move")
  end

  after(:each) do
    @toyRobot = nil
    @moveCommand = nil
  end

  it "can't move if toy robot is not placed" do
    expect { @moveCommand.execute(@toyRobot)}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "can move when toy robot is placed" do
    placeCommand = PlaceCommand.new("Place 0, 1, North")
    placeCommand.execute(@toyRobot)
    @moveCommand.execute(@toyRobot)     
    expect(@toyRobot.yCoordinate).to eql 2

  end

end