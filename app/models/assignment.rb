class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  before_create :capture_task_status

  private

    def capture_task_status
      self.task_status ||= task.status
    end
end
