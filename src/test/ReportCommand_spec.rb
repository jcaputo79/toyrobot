require 'minitest/spec'
require_relative '../main/domain/ToyRobot.rb'
require_relative '../main/exception/ToyRobotExceptions.rb'
require_relative '../main/command/ReportCommand.rb'
require_relative '../main/command/PlaceCommand.rb'

describe ReportCommand do

  before(:each) do
    @toyRobot = ToyRobot.new
    @reportCommand = ReportCommand.new("Report")
  end

  after(:each) do
    @toyRobot = nil
    @ReportCommand = nil
  end

  it "can't report it's location when toy robot is not placed" do
    expect { @reportCommand.execute(@toyRobot)}.to raise_error ToyRobotExceptions::NotOnTableError
  end

  it "can report it's location when the toy robot is on the table" do
    placeCommand = PlaceCommand.new("Place 0, 1, North")
    placeCommand.execute(@toyRobot)
    expect{@reportCommand.execute(@toyRobot)}.to_not raise_error
  end

end