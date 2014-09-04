require 'minitest/spec'
require_relative '../main/domain/Table.rb'

describe Table do 

  before(:each) do
    @table = Table.new
  end

  after(:each) do
    @table = nil
  end

  it "returns true when checking two valid coordinates" do 
    expect(@table.valid_position?(4,4)).to eql true 
  end

  it "returns false when checking one invalid coordinates" do 
    expect(@table.valid_position?(4,6)).to eql false 
  end

  it "returns false when checking two invalid coordinates" do 
    expect(@table.valid_position?(100,6)).to eql false
  end

end