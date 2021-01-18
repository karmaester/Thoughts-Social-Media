class User < ApplicationRecord
  has_one_attached :avatar_image
  has_one_attached :cover_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def any_attached?
    ActiveStorage::Attachment.where(record_type: model_name.to_s, record_id: id).any?
  end
end
