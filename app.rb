require 'exif'
require 'csv'

jpg_files = Dir["./*.jpg"]
puts jpg_files

CSV.open('cli_exif.csv', 'wb' ) do |row|
  jpg_files.each do |f|
    longitude = Exif::Data.new(IO.read(f)).gps_longitude 
    latitude = Exif::Data.new(IO.read(f)).gps_latitude
    row << [f, longitude, latitude]
  end
end

