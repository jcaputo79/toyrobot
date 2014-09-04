require 'minitest/spec'
require_relative '../main/command/CommandParser.rb'
require_relative '../main/command/LeftCommand.rb'
require_relative '../main/command/RightCommand.rb'
require_relative '../main/command/PlaceCommand.rb'
require_relative '../main/command/ReportCommand.rb'

describe CommandParser do
  
  it "can parse the word Left and return a LeftCommand instance" do
    expect(CommandParser::get_command("Left")).to be_a LeftCommand
  end

  it "can parse the word Right and return a RightCommand instance" do
    expect(CommandParser::get_command("Right")).to be_a RightCommand
  end

  it "can parse the Place command string and return a PlaceCommand instance" do
    expect(CommandParser::get_command("Place 0, 0, NORTH")).to be_a PlaceCommand
  end

  it "can parse the Report command string and return a ReportCommand instance" do
    expect(CommandParser::get_command("Report")).to be_a ReportCommand
  end

  it "will return nil if passed an unknown command" do
    expect(CommandParser::get_command("Unknown")).to be_a NilClass
  end

  it "can handle spaces in the command string" do
    expect(CommandParser::get_command("    Right")).to be_a RightCommand
  end

  it "can parse an upercase Right command and return an RightCommand instance" do
    expect(CommandParser::get_command("RIGHT")).to be_a RightCommand
  end

  it "will throw a ArgumentError if bad coordinates are passed to the Place command" do
    expect { CommandParser::get_command("Place 5,7,North")}.to raise_error ArgumentError 
  end

  it "will throw a ArgumentError if a bad direction is passed to the Place command" do
    expect { CommandParser::get_command("Place 5,7,NotValid")}.to raise_error ArgumentError 
  end


end
