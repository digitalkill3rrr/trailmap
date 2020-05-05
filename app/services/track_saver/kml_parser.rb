class TrackSaver
  class KmlParser
    def initialize(file, user_id)
      @parsed_file = Nokogiri::XML(file)
      @user_id = user_id
    end

    def call
      { track: get_track_points.to_json, spots: get_spots }
    end

    private

    def get_track_points
      coordinates = @parsed_file.at_css('Placemark LineString coordinates')&.text
      return [] if coordinates.blank?

      coordinates.split("\n").map do |point|
        point.strip.split(',')[0..1].map(&:to_f)
      end.reject(&:blank?)
    end

    def get_spots
      spots = @parsed_file.css('Point').map { |node| node.ancestors('Placemark') }
      spots.map do |spot|
        coordinates = spot.at_css('Point coordinates')&.text&.split(',')
        next if coordinates.blank?

        {
          name: spot.at_css('name')&.text,
          description: spot.at_css('description')&.text,
          longitude: coordinates[0].to_f,
          latitude: coordinates[1].to_f,
          status: 0,
          user_id: @user_id
        }
      end
    end
  end
end

