class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :stream_service
      t.string :image

      t.timestamps
    end
  end
end
