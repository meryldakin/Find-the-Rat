class CreateUsers < ActiveRecord::Migration
  create_table :users do |t|
    t.string :name
    t.string :agent_name
  end
end
