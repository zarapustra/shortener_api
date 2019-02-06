class ApiController < ActionController::API
  def not_found
    render status: 404
  end

  def invalid(errors)
    render json: { errors: errors }, status: 422
  end

  def ok(render_params)
    render render_params
  end
end
