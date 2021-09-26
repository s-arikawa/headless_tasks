# frozen_string_literal: true

module TasksUseCases
  # タスクを新規作成する
  class Create < ApplicationUseCase
    # @param [Hash] params
    # @option name タスク名
    # @return [Task] 作成したTask
    def create_task(params = {})
      new_task = Task.new(params)
      new_task.save!
      new_task
    end
  end
end
