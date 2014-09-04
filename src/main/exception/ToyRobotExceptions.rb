=begin
  * Name: ToyRobotExceptions
  * Description This module contains a couple of custom
  * defined exceptions used by the Robot program
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end

module ToyRobotExceptions

	class BadMoveError < StandardError

		def initialize(msg = "Awww, bad move error")
	    	super(msg)
	  end

	end

	class NotOnTableError < StandardError

		def initialize(msg = "Awww, not on table error")
	    	super(msg)
	  end

	end

	class BadCommandError < StandardError

		def initialize(msg = "Awww, command not found")
	    super(msg)
	  end

	end
end