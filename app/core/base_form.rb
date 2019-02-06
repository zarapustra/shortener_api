class BaseForm < Rectify::Form
  include Virtus.model
  include ActiveModel::Validations

  def valid?(options = {})
    result = super(options)
    after_validation if result
    result
  end

  def after_validation; end
end
