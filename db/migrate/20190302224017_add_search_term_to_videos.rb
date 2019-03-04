class AddSearchTermToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :search_term, :string
  end
end
