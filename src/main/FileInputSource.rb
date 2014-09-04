require_relative 'InputSource'

=begin
  * Name: FileInputSource
  * Description This class, which extends InputSource manages opening and
  * reading a file line by line
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class FileInputSource < InputSource

	# Constructor
	# @param fileName String the full file name and path of a file which contains commands
	def initialize(fileName)

		#if the file exists, let's open it!
		if (File.exist?(fileName))
			@file = File.open(fileName, "r")
		else
			raise ArgumentError, "This file does not exist"
		end

	end

	# method that all InputSources must override.
	# @return String the line that was just read
	def read_next_command

		if !@file.eof
			@file.readline
		else
			@file.close
		end

	end

end