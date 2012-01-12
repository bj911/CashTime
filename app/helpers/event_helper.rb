module EventHelper

  def choose(event,info)
    if info == event.event_type
      case info
        when "navigation"
          "Path = #{event.info[:path]} --- #{event.info[:type]} --- Created_at = #{event.info[:time]}"
        when "comments"
          "ID = #{event.info[:pict_id]} --- Comment = #{event.info[:body]} --- Created_at = #{event.info[:time]}"
        when "likes"
          "ID = #{event.info[:pict_id]} --- Created_at = #{event.info[:time]}"
        when "user_sign_in"
          "Sign_in = #{event.info[:time]}"
        when "user_sign_out"
          "Sign_out = #{event.info[:time]}"
        else ""
      end
    end
  end

  def pict(event,info)
     if (info == event.event_type) and (event.info[:pict_id] != nil)
      case info
        when "comments"
          image_tag Picture.find_by_id(event.info[:pict_id]).logo.url(:thumb)
        when "likes"
          image_tag Picture.find_by_id(event.info[:pict_id]).logo.url(:thumb)
        else ''
      end
    end
  end

end
