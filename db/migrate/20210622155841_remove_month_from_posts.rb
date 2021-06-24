class RemoveMonthFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :month, :text
    remove_column :posts, :year, :text
    remove_column :posts, :adress, :text
    remove_column :posts, :address, :integer
  end
end
