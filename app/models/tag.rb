class Tag < ApplicationRecord
  REGEX = /\A |#[\w[:alpha:]]+/

  self.per_page = 5

  has_many :post_tags
  has_many :posts, through: :post_tags

  scope :top30, lambda {
    joins(:post_tags).group(:id).order('COUNT(post_tags) DESC').limit(25)
  }

  validates :name, presence: true, length: { maximum: 40 }

  def to_param
    name
  end
end
