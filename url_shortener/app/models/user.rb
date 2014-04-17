class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :email, :uniqueness => true

  has_many :submitted_urls, :class_name => 'ShortenedUrl', :foreign_key => :user_id, :primary_key => :id
  has_many :vists, :class_name => 'Visit', :foreign_key => :user_id, :primary_key => :id

  has_many :visted_urls, :through => :vists, :source => :short_url
end
