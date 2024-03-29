class CreateYoutubeTrailers < ActiveRecord::Migration[7.1]
  def change
    create_table :youtube_trailers do |t|
      t.string :name
      t.string :key
      t.string :backdrop_path
      t.references :movie, null: false, foreign_key: true
    end
  end
end
