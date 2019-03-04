class AddTopicToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :topic, foreign_key: true
  end
end
