class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :uri
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
