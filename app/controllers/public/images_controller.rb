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

        require "google/cloud/vision"
        image_path = "#{output_path}"
        image_annotator = Google::Cloud::Vision.image_annotator
        response = image_annotator.text_detection(
        image:       image_path,
        max_results: 1 # optional, defaults to 10
        )

        response.responses.each do |res|
            res.text_annotations.each do |text|
                puts text.description
                text.bounding_poly.vertices.each do | vertex |
                    byebug
                puts "  x: #{vertex.x}, y: #{vertex.y}" 
                end
            end
        end

        #最後に写真を削除
        redirect_to image_path
    end
end
