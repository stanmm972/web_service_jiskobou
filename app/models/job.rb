class Job < ApplicationRecord

    belongs_to :user

    self.primary_key = 'user_id'

    def user_full_name
        user.full_name
    end

end

