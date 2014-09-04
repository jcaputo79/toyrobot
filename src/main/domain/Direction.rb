=begin
  * Name: Direction
  * Description: This module defines an arry of Direction symbols used 
  * the Robot Simulator.  It's used to verify a direction that's used
  * by a place command actually exists as a vaild direction
  * reading a file line by line
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end

module Direction

	#we don't want this to change.  Let's protect it by freezing it
	DIRECTIONS = {:North => 'North', :East => 'East', :South => 'South', :West => 'West'}.freeze

	# Ths method takes a direction (as a string)
	# and checks the DIRECTION array to see if it exists (converted to symbol)
	# @param direction String direction, as a string
	# @return Boolean
	def self.valid_direction?(direction)

		DIRECTIONS.include?(direction.to_sym)

	end

	def self.get_direction_value(direction)

		DIRECTIONS[direction.to_sym]
	end

end