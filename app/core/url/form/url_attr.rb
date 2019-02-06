class Url::Form::UrlAttr < Virtus::Attribute
  def coerce(value)
    return nil unless value.present? && value.is_a?(String)
    value.strip.downcase
  end
end
