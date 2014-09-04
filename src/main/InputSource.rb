=begin
  * Name: ImputSource
  * Description Classes that will be used as input (console, file) for the Robot simulator should
  * extend this class
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class InputSource

	def read_next_command
    raise NotImplementedError, "Implement this method in a child class"
  end

end