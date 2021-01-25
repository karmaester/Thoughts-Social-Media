class Thought < ApplicationRecord
  belongs_to :user, -> { includes(avatar_image_attachment: :blob) }

  validates :thought, presence: true, length: { maximum: 200,
                                                too_long: '200 characters is the maximum allowed.' }
end
