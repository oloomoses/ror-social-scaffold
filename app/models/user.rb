class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :pending_friendships, -> { where confirmed: nil }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_requests, through: :pending_friendships, source: :friend

  has_many :requested_friendships, -> { where confirmed: nil }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friend_requests, through: :requested_friendships, source: :user

  def friends
    friends_array = friendships.map do |f|
      f.friend if f.confirmed
    end && inverse_friendships.map do |f|
             f.user if f.confirmed
           end
    friends_array.compact
  end

  def confirm_friend(user)
    friend = inverse_friendships.find { |fr| fr.user == user }
    friend.confirmed = true
    friend.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
