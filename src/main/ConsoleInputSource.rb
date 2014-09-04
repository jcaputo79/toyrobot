require_relative 'InputSource.rb'

=begin
  * Name: ConsoleInputSource
  * Description This class, which extends InputSource manages reading
  * input from the console
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class ConsoleInputSource < InputSource 

	# This method just returns the command entered
	# by the user on the console
	# @return String 
	def read_next_command

		#read the next thing that our user entered
		$stdin.gets.chomp
	end

end