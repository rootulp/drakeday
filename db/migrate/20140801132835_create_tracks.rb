class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :url
      t.string :provider # Soundcloud or Youtube
      t.string :iframe_info
      t.string :era # Old, Mid, or New
 
      t.timestamps
    end
  end
end
