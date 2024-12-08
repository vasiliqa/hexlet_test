# frozen_string_literal: true

class AddUserIdToPostComments < ActiveRecord::Migration[7.2]
  def change
    add_column :post_comments, :user_id, :integer
    add_index :post_comments, :user_id
  end
end
