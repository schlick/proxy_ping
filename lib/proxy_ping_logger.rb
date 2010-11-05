module Rails
  module Rack
    class Logger

      # override existing method in railties
      def before_dispatch(env)
        request = ActionDispatch::Request.new(env)
        path = request.fullpath

        info "\n\nStarted #{env["REQUEST_METHOD"]} \"#{path}\" " \
             "for #{request.ip} at #{Time.now.to_default_s}" unless path == '/proxy_ping'
      end

    end
  end
end