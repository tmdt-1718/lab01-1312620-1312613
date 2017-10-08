class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :thumbnail, ThumbnailUploader
end
