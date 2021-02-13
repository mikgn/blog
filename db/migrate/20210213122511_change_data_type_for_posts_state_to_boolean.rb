class ChangeDataTypeForPostsStateToBoolean < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :active, :boolean, default: true

    Post.find_each do |post|
      if post.state == 'active'
        post.update(active: true)
      else
        post.update(active: false)
      end
    end

    remove_column :posts, :state, :string
  end
end
