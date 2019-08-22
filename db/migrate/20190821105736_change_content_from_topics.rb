class ChangeContentFromTopics < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :content, :text
  end
end
