class MovieSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :synopsis,
             :image,
             :url,
             :stream_service
end
