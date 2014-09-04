require_relative "Direction.rb"
require_relative "Table.rb"
require_relative "../exception/ToyRobotExceptions.rb"

class ToyRobot

	attr_reader :direction
	attr_reader :xCoordinate
	attr_reader :yCoordinate
	attr_reader :table

	def initialize
		@direction = :Invalid
		@xCoordinate = 0
		@yCoordinate = 0
		@table = Table.new
		@robotOnTable = false
 	end

	def is_on_table?
		@robotOnTable
	end

	def set_direction(newDirection)
		if (Direction::valid_direction?(newDirection))
			@direction = newDirection
		end
	end

	def set_x_coordinate(newXCoordinate)
		@xCoordinate = newXCoordinate
	end

	def set_y_coordinate(newYCoordinate)
		@yCoordinate = newYCoordinate
	end

	def set_robot_on_board(robotOnTable)
		@robotOnTable = robotOnTable
	end

	def turn_left

		raise ToyRobotExceptions::NotOnTableError, "The robot is not on the table!" if !is_on_table?

		case direction
		when :North
			set_direction(:West)
		when :East
			set_direction(:North)
		when :South
			set_direction(:East)
		when :West
			set_direction(:South)
		end

		self
	end

	def turn_right
		raise ToyRobotExceptions::NotOnTableError, "The robot is not on the table!" if !is_on_table?
		
		case direction
		when :North
			set_direction(:East)
		when :East
			set_direction(:South)
		when :South
			set_direction(:West)
		when :West
			set_direction(:North)
		end

		self
	end

	def move

		newYCoordinate = yCoordinate
		newXCoordinate = xCoordinate

		if is_on_table?

			case direction
			when :North
				newYCoordinate = yCoordinate + 1
			when :East
				newXCoordinate = xCoordinate + 1
			when :South
				newYCoordinate = yCoordinate - 1
			when :West
				newXCoordinate = xCoordinate - 1
			end

			if(@table.valid_position?(newXCoordinate, newYCoordinate))

				set_x_coordinate(newXCoordinate)
				set_y_coordinate(newYCoordinate)

				self

			else
				raise ToyRobotExceptions::BadMoveError
			end

		else
			raise ToyRobotExceptions::NotOnTableError
		end

	end

	def report_position()
		raise ToyRobotExceptions::NotOnTableError, "The robot is not on the table!" if !is_on_table?
		xCoordinate.to_s + ', ' + yCoordinate.to_s + ', ' + direction.to_s
	end

	def place_robot_on_table(placeCommand)

		set_x_coordinate(placeCommand.xCoordinate)
		set_y_coordinate(placeCommand.yCoordinate)
		set_direction(placeCommand.direction)
		set_robot_on_board(true)

	end

	private :set_x_coordinate, :set_y_coordinate, :set_direction, :set_robot_on_board

end