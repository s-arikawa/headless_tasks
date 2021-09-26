# frozen_string_literal: true

json.tasks do
  json.array! @tasks, :id, :name, :status
end
