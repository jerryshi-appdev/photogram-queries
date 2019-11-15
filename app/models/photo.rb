# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
    def poster
        return User.where({ :id => self.owner_id}).first
    end
    def comments
        return Comment.where({ :photo_id => self.id})
    end
    def likes
        return Like.where({ :photo_id => self.id})
    end
    def fans
        fan_ids = Like.where({ :photo_id => self.id}).pluck(:fan_id)
        return User.where({ :id => fan_ids})
    end
    def fans
        fan_ids = Like.where({ :photo_id => self.id}).pluck(:fan_id)
        return User.where({ :id => fan_ids}).to_sentence
    end
end
