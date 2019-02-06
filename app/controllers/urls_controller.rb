class UrlsController < ApiController
  def encode
    cmd = ::Url::Cmd::Encode.new params
    cmd.subscribe self
    cmd.call
  end

  def decode
    cmd = ::Url::Cmd::Decode.new params
    cmd.subscribe self
    cmd.call
  end
end