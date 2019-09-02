class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :gender
      t.string :city
      t.string :other_city
      t.string :range_time
      t.string :email
      t.string :mobile
      t.string :wechat
      t.string :content
      t.timestamps
    end
  end
end
