require_relative "../domain/ToyRobot.rb"

=begin
  * Name: Command
  * Description: All commands that need to operate on
  * a ToyRobot will extend this class and overwrite the execute
  * method
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class Command
  def execute(toyRobot)
    raise NotImplementedError, "Implement this method in a child class"
  end
end
