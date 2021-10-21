class CloudVisionApiClient
  
    PARENT = 'hogehoge'
  
    class << self
      def client
        api_host = 'https://vision.googleapis.com/v1/'
        Faraday.new(url: api_host) do |faraday|
          faraday.request :url_encoded # form-encode POST params
          faraday.response :logger, Rails.logger # log requests to STDOUT
          faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
        end
      end
  
      def image_annotate(image)
        res = client.post('images:annotate') do |req|
  
          req.params[:requests] = image
          req.params[:parent] = PARENT
        end
        JSON.parse(res.body, symbolize_names: true).merge({ status: res.status })
      end
    end
  end