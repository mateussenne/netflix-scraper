class Movie < ApplicationRecord
  validates_presence_of :name, :url
  enum stream_service: { netflix: 0, prime_video: 1 } # I'll probably use the same database to add more stream_services later  
end
