class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales

  validates_numericality_of :price, greater_than: 49, message: 'Must be at least 50 cents'

  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image, content_type: /^image\/(png|gif|jpeg|jpg)/, message: "Only images allowed"

  validates_attachment_content_type :resource, content_type: ['application/pdf'], message: "Only pdfs Allowed"

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true
end
