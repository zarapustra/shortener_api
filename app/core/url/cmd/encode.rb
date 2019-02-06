class Url::Cmd::Encode < Rectify::Command
  attr_reader :form, :slug, :url

  def initialize(params)
    @form = Url::Form::EncodeForm.from_params(params)
  end

  def call
    return broadcast(:invalid, form.errors) unless form.valid?

    record = Url.find_by(url: form.url)
    if record
      @slug = record.slug
    else
      loop do
        @slug = get_slug
        break unless Url.find_by(slug: slug)
      end
      Url.create(url: form.url, slug: slug)
    end

    broadcast(:ok, render_params)
  end

  private

  def render_params
    { json: { url: short_url },
      status: :ok }
  end

  def get_slug
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    6.times.map { chars.sample }.join
  end

  def short_url
    UrlHelper.full_url(slug)
  end
end
