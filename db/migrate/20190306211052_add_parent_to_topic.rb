class AddParentToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :parent_id, :integer
  end
end
