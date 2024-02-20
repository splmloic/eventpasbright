class Attendance < ApplicationRecord
    after_create :welcome_send

    belongs_to :user
    belongs_to :event
end
