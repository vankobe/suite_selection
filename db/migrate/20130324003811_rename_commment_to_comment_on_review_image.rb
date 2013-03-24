class RenameCommmentToCommentOnReviewImage < ActiveRecord::Migration
  def up
    rename_column :review_images, :commment, :comment
  end

  def down
    rename_column :review_images, :comment, :commment
  end
end
