module FlightsHelper
  def format_duration(minutes)
    duration = ActiveSupport::Duration.build(minutes * 60)
    parts = duration.parts.map { |part, value| "#{value}#{part.to_s[0]}" }
    parts.join
  end
end
