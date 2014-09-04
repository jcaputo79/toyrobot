require_relative "Command.rb"
require_relative "../domain/ToyRobot.rb"

=begin
  * Name: RightCommand
  * Description: This class, which extends Command
  * turns the robot right
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class RightCommand < Command

	def initialize (commandString)

	end

	# delegate the execute method to toyRobot's turn_right command
	def execute(toyRobot)
		raise "Argument error.  Needs to be of type ToyRobot" unless toyRobot.kind_of?(ToyRobot)
		toyRobot.turn_right()
	end

end