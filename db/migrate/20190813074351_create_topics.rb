class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :image
      t.string :title
      t.string :content      
      t.timestamps
    end
  end
end
