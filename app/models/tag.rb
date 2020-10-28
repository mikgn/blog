class Tag < ApplicationRecord
  REGEX = /\A |#[\w[:alpha:]]+/

  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name, presence: true,
              length: { maximum: 40 }

  def to_param
    name
  end
end
