class Image < ApplicationRecord
  belongs_to :user
  belongs_to :album

  mount_uploader :source, ImageUploader
end
