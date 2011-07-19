class Photo < ActiveRecord::Base
  attr_accessible :user_id, :image, :comment, :tag_id, :latitude, :longitude, :address
  
  belongs_to :user
  belongs_to :college
  belongs_to :school
  belongs_to :dorm
  has_many :comments, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_one :tag
  
  
  #validates :title, :presence     => true, 
   #                 :length       => { :within => 2..40 }
  validates :comment, :presence     => true, 
                    :length       => { :within => 2..141 }    
  validates :image, :presence     => true 
  validates :user_id, :presence     => true 
  validates :tag_id, :presence     => true                
  
  geocoded_by :address 
  after_validation :geocode, :if => :address_changed?  
  
  mount_uploader :image, ImageUploader
  
  def self.from_users_followed_by(user)
      where(:user_id => user.following.push(user))
  end
  
  default_scope :order => 'photos.created_at DESC'
    
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

  def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids})",
            { :user_id => user })
  end
  
  
  
  
end
