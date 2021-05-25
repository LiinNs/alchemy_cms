# frozen_string_literal: true

module Alchemy
  module Ingredients
    # A picture assignment
    #
    # Assign Alchemy::Picture to this ingredient
    #
    # Optionally you can add a link
    # As well as set the alt tag, a caption and title
    #
    class Picture < Alchemy::Ingredient
      include Alchemy::PictureThumbnails

      ingredient_attributes(
        :alt_tag,
        :caption,
        :crop_from,
        :crop_size,
        :css_class,
        :link_class_name,
        :link_target,
        :link_title,
        :link,
        :render_size,
        :title,
      )

      related_object_alias :picture

      delegate :image_file_width, :image_file_height, :image_file, :name, to: :picture, allow_nil: true

      # The first 30 characters of the pictures name
      #
      # Used by the Element#preview_text method.
      #
      # @param [Integer] max_length (30)
      #
      def preview_text(max_length = 30)
        picture&.name.to_s[0..max_length - 1]
      end
    end
  end
end
