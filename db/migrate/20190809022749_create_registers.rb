class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :gender
      t.string :marriage
      t.string :email
      t.string :minzu
      t.string :age
      t.string :zhengzhi
      t.string :jiguan
      t.string :wenhuachengdu
      t.string :biyexuexiao
      t.string :zhuanye
      t.string :biyeshijian
      t.string :waiyushuiping
      t.string :yingpinzhiwei
      t.string :lianxidianhua
      t.string :jianli_path
      t.text :jianli
      t.timestamps
    end
  end
end
