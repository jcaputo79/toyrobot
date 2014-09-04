=begin
  * Name: Table
  * Description: Sime class that represents a table
  * that's 5 units by 5 unites
  * Author: Giuseppe Caputo
  * Date: 04/09/2014
  * License: N/A
=end
class Table

  # define some constants.  The table is always 5 by 5
  Width = 5
 	Height = 5

  def valid_x_coordinate?(xCoordinate)
  	xCoordinate >=0 && xCoordinate <= Width
  end

  def valid_y_coordinate?(yCoordinate)
  	yCoordinate >=0 and yCoordinate <= Height
  end

  def valid_position?(xCoordinate, yCoordinate)
  	valid_x_coordinate?(xCoordinate) && valid_y_coordinate?(yCoordinate)
  end

  private :valid_x_coordinate?, :valid_y_coordinate?

end