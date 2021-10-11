require 'base64'
require 'json'
require 'net/https'
require "google/cloud/vision/v1"
module Vision
  class << self
    def image_analysis(profile_image=nil)
        image_annotator = Google::Cloud::Vision::V1::ImageAnnotator::Client.image_annotator do |config|
            config.credentials=JSON.parse(File.open('crafty-centaur-327921-7d5004602e5b.json') {|f| f.read} )
        # (
        #   version: :v1,
        #   credentials: JSON.parse(File.open('crafty-centaur-327921-7d5004602e5b.json') do |f| f.read end)
        # )
        end
      
      # リクエストパラメータ作成
      #  image = profile_image # 解析させたい画像(引数)
      file_path=Rails.root.join("tmp/images/S__9699340.jpg")
      image=File.open(file_path)
      requests_content = { image: { content: image }, features: [{ type: :SAFE_SEARCH_DETECTION }] }
      requests =   [requests_content]

      # Cloud Vision APIに画像を送信
      response = image_annotator.batch_annotate_images(requests)
      result = response.responses[0].safe_search_annotation.to_h
      p result

      # 解析結果が「LIKELY」又は「VERY_LIKELY」を含む場合はfalse、それ以外はtrueを返す
    #   if result.values.include?(:LIKELY) || result.values.include?(:VERY_LIKELY)
    #     return false
    #   else
    #     return true
    #   end
    end
  end
end