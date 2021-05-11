class AddCommensCounterToUsersAnd < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comments_count, :integer
    add_column :posts, :comments_count, :integer

    User.find_each do |user|
      User.reset_counters(user.id, :comments)
    end

    Post.find_each do |post|
      Post.reset_counters(post.id, :comments)
    end
  end
end
