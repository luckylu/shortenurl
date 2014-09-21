class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shorturl
      t.string :longurl

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute "INSERT INTO urls(rowid, shorturl, longurl) VALUES(238328, 'test', 'hello');"
      end
      dir.down do
       execute "DELETE FROM urls WHERE rowid=238328;"
      end
    end
  end
end
