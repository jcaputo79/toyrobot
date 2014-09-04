require_relative "Command.rb"
require_relative "../domain/Direction.rb"
require_relative "../domain/ToyRobot.rb"

=begin
  * Name: PlaceCommand
  * Description: This class, which extends Command, ensures
  * a valid Place command has been sent.  It uses regex to
  * parse a commandString.  It will then execute the place_robot_on_table method
  * of a toy robot
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class PlaceCommand < Command

	attr_reader :xCoordinate
	attr_reader :yCoordinate
	attr_reader :direction
	# initialize some things
	def initialize (commandString)

		@xCoordinate = -1
		@yCoordinate = -1
		@direction = :Invalid

		init(commandString)

	end

	# Helper method that parses the passed in command string
	# @param String commandString The place command to parse
	# @return void
	def init(commandString)

		# will accept a few different combinations, and in case insensitive form as well, 
		# For example:
		# PLACE     0   ,   5,     North or
		# Place 0, 5, East
		acceptedPattern = /\s*Place\s+([0-5])\s*,\s*([0-5])\s*,\s*(\w+)/i

		match = commandString.match acceptedPattern

		#if there was a match
		if match

			@xCoordinate = Integer(match[1])
			@yCoordinate = Integer(match[2])

			# if the direction doesn't match one of the accepted values
			
			raise ArgumentError, "Direction is not valid. Expected: [North|East|South|West]  Received: " + match[3].to_s, caller if !Direction::valid_direction?(match[3].capitalize)

			# if we got this far, that means we can get the value of the direction from the Directions symbol array
			@direction = Direction::get_direction_value(match[3].capitalize).to_sym
		
		# no match at all.  Let's throw an exception
		else
			raise ArgumentError, "Place command is not valid. Expected: PLACE x[0-5], y[0-5], Direction.  Received: " + commandString
		end
	end

  # The execute method all Command objects need to override
	def execute(toyRobot)
		raise "Argument error.  Needs to be of type ToyRobot" unless toyRobot.kind_of? ToyRobot
		
		#if the x and y coordinates are actually on the table, let's place the toy
		if toyRobot.table.valid_position?(xCoordinate, yCoordinate)
			toyRobot.place_robot_on_table(self)
		end
	end

end