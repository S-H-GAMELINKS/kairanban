class AddUserToNotices < ActiveRecord::Migration[6.0]
  def change
    add_reference :notices, :user, null: false, foreign_key: true, default: 0
  end
end
