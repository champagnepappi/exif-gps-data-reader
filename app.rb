require 'exif'
require 'csv'

if ARGF.argv.empty?
  jpg_files = Dir["./*.jpg"]
else
  jpg_files = Dir["#{ARGF.argv[0]}/*.jpg"]
end
puts jpg_files

CSV.open('cli_exif.csv', 'wb' ) do |row|
  jpg_files.each do |f|
    longitude = Exif::Data.new(IO.read(f)).gps_longitude 
    latitude = Exif::Data.new(IO.read(f)).gps_latitude
    row << [f, longitude, latitude]
  end
end

CSV.foreach("cli_exif.csv") do |row|
  p row
end
