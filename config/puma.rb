environment ENV['RACK_ENV']
treads 0,5

workers 3

preload_app!

on_worker_boot do
  ActiveSuppor.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
