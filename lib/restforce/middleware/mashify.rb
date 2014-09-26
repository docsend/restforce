module Restforce
  # Middleware the converts sobject records from JSON into Restforce::SObject objects
  # and collections of records into Restforce::Collection objects.
  class Middleware::Mashify < Faraday::Response::Mashify

    def parse(body)
      Restforce::Mash.build(body, @client)
    end

    def initialize(app = nil, client = nil, options = {})
      super(app)
      @client = client
      @options = options
    end

  end
end
