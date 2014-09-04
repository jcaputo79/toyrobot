require 'optparse'
require_relative 'FileInputSource.rb'
require_relative 'ConsoleInputSource.rb'
require_relative 'domain/ToyRobot.rb'
require_relative 'command/CommandParser.rb'
require_relative "exception/ToyRobotExceptions.rb"


=begin
  * Name: Simulator
  * Description This class simulates the movement of a toy robot on a table that's 5 units by 5 units
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class Simulator

	#member variables

	@toyRobot = nil

	# initialize our things
	def initialize
		@toyRobot = ToyRobot.new
		init()

	end

	# helper method to display our options for the program
	# It figures out whether or not to use a FileInputSource
	# or ConsoleInputSource object depending.  This is dependent on
	# whether or not the --filename is included when running the program
	# @return void
	def init
		options = {:filename => nil}

		parser = OptionParser.new do|opts|
			opts.banner = "Usage: ruby Simulator.rb [options].  If you don't supply a file name, commands will be recieved from the command line"
			
			opts.on('-f', '--filename filename', 'The file name you want to read commands from') do |filename|
				options[:filename] = filename;
			end

			#show the banner and our options
			puts opts
		end

		parser.parse!

		inputSource = nil

		# if a file name was not given, let's just read from the console
		if options[:filename] == nil

			inputSource = ConsoleInputSource.new

		# otherwise, let's read from the file that was given to us
		else

			begin
				inputSource = FileInputSource.new(options[:filename])
			rescue ArgumentError => e
				abort("Unable to open file: " + options[:filename].to_s)
				die
			end

		end

		# while there is more input, let's read in a command
		while commandString = inputSource.read_next_command()

 			if commandString.length > 0
  			execute_found_command(commandString)
  		end
		end
 
	end
	
	# This method takes a command, which is represented as a
	# string, tries to parse it and if successful, executes the command on
	# this instance's robot
	# @param commandString String the command string that we'll try to parse
	# @return void

	def execute_found_command(commandString)

			begin
				command = CommandParser::get_command(commandString)
			rescue ArgumentError => e 
				puts e.message
			end
			if(command)
				begin
					command.execute(@toyRobot)
				rescue ToyRobotExceptions::NotOnTableError
					puts "Can't move - Not on table"
				rescue ToyRobotExceptions::BadMoveError
					puts "Aww, the robot will fall off the table"
				end

			end
			
	end

end

#start the thing
sim = Simulator.new