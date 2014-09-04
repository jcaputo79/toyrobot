require_relative "Command.rb"
require_relative "../domain/ToyRobot.rb"

=begin
  * Name: LeftCommand
  * Description: This class, which extends Command
  * moves the robot forward in the direction it is facing
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class MoveCommand < Command

	# constructor
	def initialize (commandString)

	end

	# delegate the execute method to the toyrobot's move command
	def execute(toyRobot)
		raise "Argument error.  Needs to be of type ToyRobot" unless toyRobot.kind_of?(ToyRobot)
		toyRobot.move
	end

end