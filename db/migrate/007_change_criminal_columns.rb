class ChangeCriminalColumns <ActiveRecord::Migration
  def change
    rename_column :criminals, :crime_location, :century
    add_column :criminals, :trivia, :string    
  end
end
