# require 'cool-gem'
require 'json'

# 1) If you don't have a workspace, create one by running:
# faastruby create-workspace WORKSPACE_NAME
# 2) To deploy this function, cd into its folder and run:
# faastruby deploy-to WORKSPACE_NAME
def handler event
  data = event.body ? JSON.parse(event.body) : {}
  # FUNCTION RESPONSE
  #
  # You can render text, json, yaml, html or js. Example:
  # render html: '<p>Hello World!</p>'
  # render yaml: {hello: 'world!'}
  #
  # Status:
  # The default status is 200. You can set a custom status like this:
  # render json: {error: 'Could not perform the action'}, status: 422
  #
  # Headers:
  # The 'Content-Type' header is automatically set when you use 'render'.
  # You can set custom headers using a hash with string keys. Example:
  # render text: 'It Works!', headers: {'TransactionId' => 23928}
  render text: "Hello, #{data['name'] || 'World'}!"
end
