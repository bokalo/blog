class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
