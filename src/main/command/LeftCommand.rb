require_relative "Command.rb"
require_relative "../domain/ToyRobot.rb"

=begin
  * Name: LeftCommand
  * Description: This class, which extends Command
  * turns the robot left
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class LeftCommand < Command

	# constructor
	def initialize (commandString)

	end

	# turn the robot right by delegating the execute method to
	# the robot's turn_left command
	def execute(toyRobot)
		raise "Argument error.  Needs to be of type ToyRobot" unless toyRobot.kind_of?(ToyRobot)
		toyRobot.turn_left()

	end

end