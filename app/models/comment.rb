class Comment < ApplicationRecord
  default_scope -> { includes(:user) }

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  validates :user, presence: true
  validates :post, presence: true
  validates :text, presence: true
end
