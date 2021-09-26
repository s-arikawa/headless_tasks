# frozen_string_literal: true

# タスクを表すスキーマ
class Task < ApplicationRecord
  TODO  = 'Todo'
  DOING = 'Doing'
  DONE  = 'Done'

  def initialize(attributes = nil)
    super
    self.status = TODO
  end

  # ステータスを _Doing_ に変更する。
  def change_status_to_doing
    self.status = DOING
  end
end
