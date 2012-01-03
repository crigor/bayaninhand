module EventsHelper
  def date_text(event)
    if(event.start_date != event.end_date)
      "#{event.start_date.strftime('%B %-d, %Y')} - #{event.end_date.strftime('%B %-d, %Y')}"
    end
  end
end
