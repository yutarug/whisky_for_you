class Public::ImagesController < ApplicationController
    require "google/cloud/vision"
    def image
        
    end

    def create
        #tmp/imagesフォルダに投稿された写真を一時保管
        uploaded_file = params[:fileupload][:file]
        output_path = Rails.root.join('tmp/images', uploaded_file.original_filename)
        File.open(output_path, 'w+b') do |fp|
    	    fp.write  uploaded_file.read
        end


        # api_key = "crafty-centaur-327921-7d5004602e5b.json" 
        # api_url = URI("https://vision.googleapis.com/v1/images:annotate?key=#{api_key}")
        # body=   {
        #             "requests": [
        #                 {
        #                 "image": {
        #                     "source": {
        #                     "imageUri": "Rails.root.join('tmp/images', uploaded_file.original_filename)"
        #                     }
        #                 },
        #                 "features": [
        #                     {
        #                     "type": "TEXT_DETECTION"
        #                     }
        #                 ]
        #                 }
        #             ]
        #         }.to_json

        # headers = { "Content-Type" => "application/json" }

        # response = Net::HTTP.post(api_url, body, headers)
        # byebug





        # require "google/cloud/vision"

        # image_annotator = Google::Cloud::Vision::ImageAnnotator.new

        #google vision apiを用いてjson形式で投稿された画像のデータを取得。

        #Bottleモデルの中でbottle_nameカラム(できればfeatureとageも参照)がjson形式で取得したデータと一致するものを全て取り出す。=>@bottlesに代入。
        # Bottle.all.each do |bottle|
            #もしもbottleとjsonのデータが一致すれば=>@bottlesに加える。
        # end

        #bottles/indexのビューファイルをrenderする。





        #最後に写真を削除
        redirect_to image_path
    end
end
