module FaradayMiddleware
  class Timer < Faraday::Middleware
		def call(request_env)
			start = Time.now
		  	@app.call(request_env).on_complete do |response_env|
		  		response_env[:time_taken] = ((Time.now - start) *1000)
		  	end
		end
	end
end
