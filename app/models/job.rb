class Job < ApplicationRecord

    belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'

    def user_full_name
        user.full_name
    end

end

