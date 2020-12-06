class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :title
      t.string :auther
      t.text :greet
      t.text :content

      t.timestamps
    end
  end
end
