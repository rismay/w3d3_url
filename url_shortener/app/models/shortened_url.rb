class ShortenedUrl < ActiveRecord::Base

  validates :short_url, :presence => true
  validates :short_url, :uniqueness => true

  belongs_to :submitter, :class_name => 'User', :foreign_key => :user_id, :primary_key => :id
  has_many :url_visit, :class_name => 'Visit', :foreign_key => :id, :primary_key => :user_id

  has_many :visitors, :through => :url_visit, :source => :user, :uniq => true

  def self.random_code
    short_url = SecureRandom.urlsafe_base64(16)
    until ShortenedUrl.where(:short_url => short_url)
      short_url = SecureRandom.urlsafe_base64(16)
    end

    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    url = ShortenedUrl.create!( :long_url => long_url,
    :short_url => ShortenedUrl.random_code,
    :user_id => user.id )

    # Visit.record_visit!(user, url)

    url
  end


  def num_clicks
    visitors.count
  end

  def num_uniques
    visitors.distinct.count(:user_id)
  end

  def num_recent_uniques
    visitors.distinct.count(:user_id).where(:created_at => (10.minutes.ago.utc..Time.now.utc))
  end
end
