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
        #google-cloud-visionにリクエストを送って、そのレスポンスをresponseに格納
        require "google/cloud/vision"
        image_path = "#{output_path}"
        image_annotator = Google::Cloud::Vision.image_annotator
        response = image_annotator.text_detection(
        image:       image_path,
        max_results: 1 # optional, defaults to 10
        )

        @bottles=Bottle.all
        @image_bottles=[]

        #response.responses.each do |res|
        res=response.responses[0]
            # res.text_annotations.each do |text| ループ処理しない

                # puts text.description
                # byebug
                # text.bounding_poly.vertices.each do | vertex |
                # puts "  x: #{vertex.x}, y: #{vertex.y}" 
                # end
                @bottles.each do |bottle|
                    # if text.description.include?("#{bottle.bottle_name}")
                    if res.text_annotations[0].description.include?("#{bottle.bottle_name}")
                        @image_bottles.push(bottle)
                    end
                end
            # end
        # end
        #最後に写真を削除
        File.delete(output_path)
        puts @image_bottles
        byebug
    end
end
