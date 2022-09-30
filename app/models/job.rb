class Job < ApplicationRecord

    belongs_to :user

    def user_full_name
        user.full_name
    end

end

