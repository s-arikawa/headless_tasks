# frozen_string_literal: true

module TasksUseCases
  # タスクを削除する
  class Delete < ApplicationUseCase
    def task_delete(id)
      target = Task.find(id)
      raise(ActiveRecord.RecordNotFound) unless target

      target.destroy!
    end
  end
end
