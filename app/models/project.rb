class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :tasks

  validates_uniqueness_of :key
  validates_presence_of :name

  before_create :sanitize_key

  scope :search_name, ->(project_name) { where("name ilike ?", "%#{sanitize_sql_like(project_name)}%") }

  private

    def sanitize_key
      self.key ||= SecureRandom.uuid.first(8).upcase
    end
end
