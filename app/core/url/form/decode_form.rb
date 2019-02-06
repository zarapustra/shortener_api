class Url::Form::DecodeForm < BaseForm
  attribute :slug, String
  attribute :url, Url::Form::ShortUrlAttr
  validates :url, presence: true, url: true

  def after_validation
    self.slug = url.strip.split('/').last
  end
end