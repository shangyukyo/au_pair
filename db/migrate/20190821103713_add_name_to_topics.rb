class AddNameToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :name, :string, :after => :image
  end
end
