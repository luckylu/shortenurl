class CreateCustomUrls < ActiveRecord::Migration
  def change
    create_table :custom_urls do |t|
      t.string :longurl
      t.string :shorturl
      t.integer :baseid
      

      t.timestamps
    end
  end
end
