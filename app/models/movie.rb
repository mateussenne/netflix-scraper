class Movie < ApplicationRecord
  validates_presence_of :name, :url
  enum stream_service: { netflix: 0 } # I'll probably use the same database to add more stream_services later
  # netflix 0
  # prime 1
  # disney 3
end
