class Profile < ActiveRecord::Base
  attr_accessible :name, :logo, :link, :gender, :birthday

  belongs_to :user

  validates :name,     presence: true
  validates :link,     presence: true
  validates :birthday, presence: true

  validates_date :birthday, before:         lambda { 18.years.ago },
                            before_message: 'must be at least 18 years old'
end