class Url::Cmd::Decode < Rectify::Command
  attr_reader :form, :record, :slug, :url

  def initialize(params)
    @form = Url::Form::DecodeForm.from_params(params)
    return unless form.valid?

    @record = Url.find_by(slug: form.slug)
  end

  def call
    return broadcast(:invalid, form.errors) unless form.valid?
    return broadcast(:not_found) unless record

    broadcast(:ok, render_params)
  end

  private

  def render_params
    { json: { url: record.url },
      status: :ok }
  end
end
