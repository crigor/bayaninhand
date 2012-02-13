module EventsHelper
  def date_text(event)
    if(event.start_date != event.end_date)
      "#{event.start_date.strftime('%B %-d, %Y')} - #{event.end_date.strftime('%B %-d, %Y')}"
    else
      "#{event.start_date.strftime('%B %-d, %Y')}"
    end
  end

  def pluralize_time(count, singular, plural = nil)
    (count == 1)  ? singular : (plural || singular.pluralize)
  end
end
