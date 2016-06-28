load File.expand_path("../../../lib/strategies/database_authentication.rb",  __FILE__)
Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :database_authentication

  # TODO: Setup warden's failure app, this will be called everytime that
  # and authentication failure happen.
  # Failure app should be a Rack application.
  # In Rails a controller can be used as a Rack app, just specify the
  # controller and the action to be called. Example:
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end

Warden::Manager.serialize_into_session(:identity) do |identity|
  identity.id
end

Warden::Manager.serialize_from_session(:identity) do |id|
  Identity.find(id)
end
