# frozen_string_literal: true

# Super Controller Class
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :illegal_argument
  rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

  private

  def record_not_found
    render plain: '404 Not Found', status: :not_found
  end

  def illegal_argument
    render plain: 'Illegal Argument Error', status: :bad_request
  end

  def handle_parameter_missing
    render plain: 'Illegal Argument Error', status: :bad_request
  end
end
