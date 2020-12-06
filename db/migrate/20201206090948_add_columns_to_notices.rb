class AddColumnsToNotices < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :to, :string
    add_column :notices, :from, :string
  end
end
