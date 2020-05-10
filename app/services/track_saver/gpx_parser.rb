class TrackSaver
  class GpxParser
    def initialize(file, user_id)
      @parsed_file = Nokogiri::XML(file)
      @user_id = user_id
    end

    def call
      { track: get_track_points.to_json, spots: get_spots }
    end

    private

    def get_track_points
      points = @parsed_file.css('trkpt')
      points.map { |point| [point['lon']&.to_f, point['lat']&.to_f] }
    end

    def get_spots
      spots = @parsed_file.css('wpt')
      spots.map do |spot|
        {
          name: spot.at_css('name')&.text,
          description: spot.at_css('desc')&.text,
          longitude: spot['lon']&.to_f,
          latitude: spot['lat']&.to_f,
          status: 0,
          user_id: @user_id
        }
      end
    end
  end
end

