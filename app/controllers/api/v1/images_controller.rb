class Api::V1::ImagesController < ApplicationController
    def index
        @images = Image.all
        render json: @images
      end
    
      def show
        @image = Image.find(params[:id])
        render json: @image
      end
    
      def create
        @image = Image.new(image_params)
        if @image.save
          render json: @image, status: :created
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end
    
      def update
        @image = Image.find(params[:id])
        if @image.update(image_params)
          render json: @image
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @image = Image.find(params[:id])
        if @image.destroy
          head :no_content
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def image_params
        params.require(:image).permit(:file_name, :file_type, :byte_size, :imageable_type, :imageable_id)
      end
end
