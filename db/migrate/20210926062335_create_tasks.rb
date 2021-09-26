# frozen_string_literal: true

# Tasksテーブル
class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end
