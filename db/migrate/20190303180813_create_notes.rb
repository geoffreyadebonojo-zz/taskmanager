class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body
      t.string :bookmark_id
      t.string :video_id

      t.timestamps
    end
  end
end
