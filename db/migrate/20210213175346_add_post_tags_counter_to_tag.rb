class AddPostTagsCounterToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :post_tags_count, :integer, default: 0
  end
end
