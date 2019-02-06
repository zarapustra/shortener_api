class Url::Form::ShortUrlAttr < Virtus::Attribute
  def coerce(value)
    return nil unless value.present? && value.is_a?(String)
    value.strip
  end
end
