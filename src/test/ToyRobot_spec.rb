require 'minitest/spec'
require_relative '../main/Command/Command.rb'
require_relative '../main/domain/ToyRobot.rb'
require_relative '../main/command/PlaceCommand.rb'
require_relative '../main/exception/ToyRobotExceptions.rb'

describe ToyRobot do 

  before(:each) do
    @placeCommand = PlaceCommand.new("PLACE 3, 4, North")
    @toyRobot = ToyRobot.new
  end

  after(:each) do
    @placeCommand = nil
    @toyRobot = nil
  end

  it "it knows when the toy robot is not on the table" do
    expect(@toyRobot.is_on_table?).to eql false 
  end

  it "knows it can't turn left when the toy robot is not on the table" do
    expect {@toyRobot.turn_left}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "knows it can't turn right when the toy robot is not on the table" do
    expect {@toyRobot.turn_right}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "knows when the toy robot is on the table" do
    @placeCommand.execute(@toyRobot)
    expect(@toyRobot.is_on_table?).to eql true 
  end

  it "knows it's x coordinate after being placed" do
    @placeCommand.execute(@toyRobot)
    expect(@toyRobot.xCoordinate).to eql 3
  end

  it "knows it's y coordinate after being placed" do
    @placeCommand.execute(@toyRobot)
    expect(@toyRobot.yCoordinate).to eql 4
  end

  it "knows it's initial direction after being placed" do
    @placeCommand.execute(@toyRobot)
    expect(@toyRobot.direction).to eql :North
  end

  it "can turn right after being placed" do
    @placeCommand.execute(@toyRobot)
    @toyRobot.turn_right
    expect(@toyRobot.direction).to eql :East
  end

  it "can turn right twice after being placed" do
    @placeCommand.execute(@toyRobot)
    @toyRobot.turn_right.turn_right
    expect(@toyRobot.direction).to eql :South
  end

  it "can turn left twice after being placed" do
    @placeCommand.execute(@toyRobot)
    @toyRobot.turn_left.turn_left
    expect(@toyRobot.direction).to eql :South 
  end

  it "knows it's x coordinate after being placed then moved" do
    @placeCommand.execute(@toyRobot)
    @toyRobot.move
    expect(@toyRobot.xCoordinate).to eql 3 
  end

  it "knows it's y coordinate after being placed then moved" do
    @placeCommand.execute(@toyRobot)
    @toyRobot.move
    expect(@toyRobot.yCoordinate).to eql 5 
  end

  it "knows when it's going to fall off the table" do
    @placeCommand.execute(@toyRobot)
    expect{@toyRobot.move.move}.to raise_error ToyRobotExceptions::BadMoveError
  end
end