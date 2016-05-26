class Book < ActiveRecord::Base
  belongs_to :genre

  has_many :roles
  has_many :authors, :through => :roles
  has_many :reviews

  validates :title, presence: true, length: { maximum: 200 }
  validates :description, length: { maximum: 400}
  validates :year, numericality: {only_integer: true}
end
