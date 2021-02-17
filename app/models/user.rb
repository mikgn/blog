class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :providers, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  before_validation :set_name, on: :create

  validates :name, presence: true, length: { maximum: 35 }

  mount_uploader :avatar, AvatarUploader

  def self.find_for_facebook_oauth(access_token)
    email = access_token.info.email
    user = find_by(email: email)

    return user if user.present?

    provider_title = access_token.provider
    uid = access_token.uid
    url = "https://facebook.com/#{uid}"
    provider = Provider.where(url: url, title: provider_title)

    if provider.present?
      provider.user
    else
      new_user = User.create(
        email: email,
        password: Devise.friendly_token.first(16)
      )

      new_user.providers.create!(
        url: url,
        title: provider_title
      )
      new_user
    end
  end

  private

  def set_name
    self.name = "User#{rand(10000000)}" if self.name.blank?
  end
end
