class User < ApplicationRecord
  has_many :notifications
  has_many :orders
  has_many :groups
  has_many :order_items
  has_many :invited_users
  has_many :user_activities
  has_many :group_friends

  has_many :friendships_as_friend_a, 
      foreign_key: :friend_a_id, 
      class_name: :Friendship
  has_many :friendships_as_friend_b, 
      foreign_key: :friend_b_id, 
      class_name: :Friendship
  has_many :friend_as, through: :friendships_as_friend_b
  has_many :friend_bs, through: :friendships_as_friend_a

  def friendships
    self.friendships_as_friend_a
  end
end
