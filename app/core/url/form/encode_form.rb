class Url::Form::EncodeForm < BaseForm
  attribute :url, Url::Form::UrlAttr
  validates :url, presence: true, url: true
end