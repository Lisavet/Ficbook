class Fanfic < ApplicationRecord
  # has_attached_file :image, styles: { }
  # do_not_validate_attachment_file_type :image
  # mount_uploader :avatar, AvatarUploader
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', :optional => true
  has_many :comments
  has_many :chapters
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :genre

  validates :title, :body, presence: true, length: {minimum: 2}

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
