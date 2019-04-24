class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :assignments
  has_many :tasks, :through => :assignments

  validates_uniqueness_of :email
  validates_presence_of :email, :name

  scope :search_name, ->(full_name) { where("name ilike ?", "%#{sanitize_sql_like(full_name)}%") }
end
