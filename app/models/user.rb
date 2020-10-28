class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_name, on: :create

  validates :name, presence: true, length: { maximum: 35 }

  private

  def set_name
    self.name = "User#{rand(10000000)}" if self.name.blank?
  end
end
