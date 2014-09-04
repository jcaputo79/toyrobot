require 'minitest/spec'
require_relative '../main/command/LeftCommand.rb'
require_relative '../main/domain/ToyRobot.rb'
require_relative '../main/exception/ToyRobotExceptions.rb'
require_relative '../main/command/PlaceCommand.rb'

describe LeftCommand do

  before(:each) do
    @leftCommand = LeftCommand.new("Left")
    @toyRobot = ToyRobot.new
  end

  after(:each) do
    @toyRobot = nil
    @leftCommand = nil
  end
  
  it "can't turn left if the toy robot is not placed on table" do
    expect { @leftCommand.execute(@toyRobot)}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "can turn left if the toy robot is placed" do
    placeCommand = PlaceCommand.new("Place 0, 1, North")
    placeCommand.execute(@toyRobot)
    @leftCommand.execute(@toyRobot)
    direction = @toyRobot.direction
    expect(direction).to eql(:West)
  end

end