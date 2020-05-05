class UserScratchpad < ApplicationRecord
    belongs_to :user
    belongs_to :scratchpad
end
