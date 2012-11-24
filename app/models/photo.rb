class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :pid, :src_small, :src_big

  validates :pid, presence: true, uniqueness: true
end
