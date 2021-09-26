# frozen_string_literal: true

# Super Controller Class
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
