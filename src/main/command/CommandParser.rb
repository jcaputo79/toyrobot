require_relative "LeftCommand.rb"
require_relative "RightCommand.rb"
require_relative "PlaceCommand.rb"
require_relative "ReportCommand.rb"
require_relative "MoveCommand.rb"
require_relative "../domain/ToyRobot.rb"
require_relative "../exception/ToyRobotExceptions.rb"

=begin
  * Name: CommandParser
  * Description: This class parses a string command.  It uses
  * some dynamic ruby to check if a class exists by prepending
  * Command with the first value of the command string ie:
  * PlaceCommand, ReportCommand, MoveCommand, LeftCommand, RightCommand
  * The joy of this is that all you need to do if you want to create new commands
  * is create a new file that followd the format <NewCommandName>Command and place
  * it in the command directory and it'll just work. :)
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class CommandParser

	# class method that tries to parse the passed in string and return
	# a command object based on the string that was passed in
	# @param String commandString The command string to parse
	def self.get_command(commandString)
			

		if(commandString == "\n")
			return nil
		end
		command = nil

		#remove all the white space and replace with just one space and remove the white space at the ends
		formattedCommandString = commandString.gsub(/\s+/m, ' ').strip

		# pull out the first word from teh command string.  hopefully it's a valid command
		firstPartOfCommand = formattedCommandString.split(" ")[0]

		# let's be sure it matches the exact command ClassName.  That means
		# we need to capitalize the first word
		capitalizedCommandName = firstPartOfCommand.strip.capitalize
		
		# see if it exists
		exists = Object.const_defined?("#{capitalizedCommandName}Command")

		# it does exist!  Let's construct a new command object
		if exists

			require_relative "#{capitalizedCommandName}Command.rb"
			clazz = Object.const_get("#{capitalizedCommandName}Command")
			command = clazz.new(formattedCommandString)

		end

		# and finally let's return it
		command
	end

end