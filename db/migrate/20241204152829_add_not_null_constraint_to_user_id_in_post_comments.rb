class AddNotNullConstraintToUserIdInPostComments < ActiveRecord::Migration[7.2]
  def change
    change_column_null :post_comments, :user_id, false
  end
end
