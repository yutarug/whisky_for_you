class Public::ImagesController < ApplicationController
    require "google/cloud/vision"
    def image
    end

    def create
        #tmp/imagesフォルダに投稿された写真を一時保管
        uploaded_file = params[:fileupload][:file]
        output_path = Rails.root.join('tmp/images', uploaded_file.original_filename)#uploaded_file.original_filename
        File.open(output_path, 'w+b') do |fp|
    	    fp.write  uploaded_file.read
        end
        #google-cloud-visionにリクエストを送って、そのレスポンスをresponseに格納
        require "google/cloud/vision"
        image_path = "#{output_path}"
        image_annotator = Google::Cloud::Vision.image_annotator
        response = image_annotator.text_detection(
        image:       image_path,
        max_results: 1 # optional, defaults to 10
        )

        #全てのボトルを@bottlesに入れる
        @bottles=Bottle.all
        #条件に合うボトルを入れるための空の配列
        @image_bottles=[]
        #写真の中の全てのテキストの中に、各々のボトルの名前が入っているかを確認→→→入っていたら@image_bottlesに入れる
        res=response.responses[0]
                @bottles.each do |bottle|
                    if res.text_annotations[0].description.include?("#{bottle.bottle_name}")
                        @image_bottles.push(bottle)
                    end
                end
        #一時保管した写真を削除
        File.delete(output_path)
        render :index
    end
end
