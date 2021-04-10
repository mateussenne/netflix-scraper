class AddSynopsisToMovies < ActiveRecord::Migration[6.0]
  def up
    add_column :movies, :synopsis, :string
  end

  def down
    remove_column :movies, :synopsis
  end
end
