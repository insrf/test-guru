class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'c2d2e6232447e61a27e3090ee29eddbe38895cc4'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Autorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
