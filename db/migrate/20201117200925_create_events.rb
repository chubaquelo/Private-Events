class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :datetime
      t.integer :author_id
      t.timestamps
    end
  end
end
