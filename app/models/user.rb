class User < ApplicationRecord
  has_one_attached :avatar_image
  has_one_attached :cover_image
  has_many :thoughts
  has_many :likes
  has_many :followeds, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followds, through: :followeds, source: :followed
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :follows, through: :followers, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :username, uniqueness: true
  validates :username, length: { maximum: 15 }
  validates :password, length: { in: 6..20 }

  def any_attached?
    ActiveStorage::Attachment.where(record_type: avatar_image.to_s, record_id: id).any?
  end
end
