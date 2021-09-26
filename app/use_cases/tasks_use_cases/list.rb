# frozen_string_literal: true

module TasksUseCases
  # タスクの一覧を検索する。
  class List < ApplicationUseCase
    # @param [Hash] params
    def all_tasks(_params = {})
      Task.all
    end
  end
end
