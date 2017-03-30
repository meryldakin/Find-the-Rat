class CriminalCapture < ActiveRecord::Base
  belongs_to :user
  belongs_to :rat_sighting
  belongs_to :criminal

  def show_data(player)
    puts CriminalCapture.where("user_id = #{player}.id")
  end


end
