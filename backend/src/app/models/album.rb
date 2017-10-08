class Album < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy

  mount_uploader :cover, CoverUploader
end
