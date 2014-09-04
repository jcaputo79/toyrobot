require_relative "Command.rb"
require_relative "../domain/ToyRobot.rb"

=begin
  * Name: ReportCommand
  * Description: This class, which extends Command
  * Reports the toyRobot's position on the table
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class ReportCommand < Command

	def initialize (commandString)

	end

	# delegate the execute method to the toyRobot's report_position method
	def execute(toyRobot)
		raise "Argument error.  Needs to be of type ToyRobot" unless toyRobot.kind_of?(ToyRobot)
		puts toyRobot.report_position()
	end

end