require 'minitest/spec'
require_relative '../main/domain/Direction.rb'

describe Direction do
  it "returns the correct value for North" do
    expect(Direction.get_direction_value("North")).to eql "North"
  end

  it "returns the correct value for East" do
    expect(Direction.get_direction_value("East")).to eql "East"
  end

  it "returns the correct value for South" do
    expect(Direction.get_direction_value("South")).to eql "South" 
  end

  it "returns the correct value for West" do
   	expect(Direction.get_direction_value("West")).to eql "West"
  end

  it "returns nil for an invalid direction" do
     expect(Direction.get_direction_value("Bad Direction")).to be_a NilClass 
  end
end