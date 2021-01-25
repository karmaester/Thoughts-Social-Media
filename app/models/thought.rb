class Thought < ApplicationRecord
    belongs_to :user, -> {includes(avatar_image_attachment: :blob)}
end
