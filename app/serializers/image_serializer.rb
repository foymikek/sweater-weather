class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :id
end
