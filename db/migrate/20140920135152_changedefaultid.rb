class Changedefaultid < ActiveRecord::Migration
  def change
  	change_table :urls do |t|
  	insert into sqlite_sequence(name,seq) values('urls', 1000)
  end
  end
end
