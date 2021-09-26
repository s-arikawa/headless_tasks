# frozen_string_literal: true

module TasksUseCases
  # タスクの一部データを変更する
  class Patch < ApplicationUseCase
    # タスクのステータスを _Doing_ に変更する。
    # @param [ID] id
    # @return [Task]
    def change_status_to_doing(id)
      target = Task.find(id)
      raise(ActiveRecord.RecordNotFound) unless target

      target.change_status_to_doing
      target.save!
      target
    end
  end
end
