class Profile < ActiveRecord::Base
  attr_accessible :name, :logo, :link, :gender, :birthday

  belongs_to :user

  validates :name,     presence: true
  validates :link,     presence: true
  validates :birthday, presence: true

  validates_date :birthday, before:         lambda { 18.years.ago },
                            before_message: 'must be at least 18 years old'

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - (self.birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end