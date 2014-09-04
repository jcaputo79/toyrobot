require 'minitest/spec'
require_relative '../main/command/RightCommand.rb'
require_relative '../main/command/PlaceCommand.rb'
require_relative '../main/domain/ToyRobot.rb'

describe RightCommand do 

  before(:each) do
    @toyRobot = ToyRobot.new
    @rightCommand = RightCommand.new("Right")
  end

  after(:each) do
    @toyRobot = nil
    @rightCommand = nil
  end

  it "can't turn right if the toy robot is not on the table" do
    expect { @rightCommand.execute(@toyRobot)}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "can turn right when toy robot is on the table" do 
    placeCommand = PlaceCommand.new("Place 0, 1, North")
    placeCommand.execute(@toyRobot)
    @rightCommand.execute(@toyRobot)
    expect(@toyRobot.direction).to eql :East
  end
                                                                           
end