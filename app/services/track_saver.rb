class TrackSaver
  ALLOWED_EXTENSIONS = %w(gpx kml)

  def initialize(file, route)
    @file = file
    @extension = File.extname(file)&.slice!(1..-1)
    @route = route
  end

  def call
    return if invalid_extension?

    result = parse_file
    @route.track = result[:track]
    @route.spots_attributes = result[:spots]
  end

  private

  def invalid_extension?
    return false if ALLOWED_EXTENSIONS.include?(@extension)

    @route.errors.add(:track, 'Допустима загрузка файлов с расширениями .gpx и .kml ')
    true
  end

  def parse_file
    class_name = 'TrackSaver::' + @extension.camelize + 'Parser'
    class_name.constantize.new(@file, @route.user_id).call
  end
end
