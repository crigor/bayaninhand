class EventsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :volunteer]
  belongs_to :organization

  def new
    @event = Event.new
    @organization = Organization.find params[:organization_id]
    @event.organization = @organization
    @frequency_days = []
    set_times
    new!
    authorize! :create, @event
  end

  def create
    @event = Event.new(params[:event])
    @organization = Organization.find params[:organization_id]
    @event.organization = @organization
    set_times
    @recurring = params[:recurring]
    @frequency_days = params[:frequency_days] || []
    authorize! :create, @event
    @event.valid? # populate @event.errors
    if @recurring && (@frequency_days.empty? || !@event.errors.empty?)
      @event.errors[:base] << "You must choose a day if this event is recurring" if @frequency_days.empty?
      render :action => :new
    elsif @recurring && !@frequency_days.empty? && @event.errors.empty?
      @recurring_event = RecurringEvent.from_event(@event)
      @recurring_event.frequency_days = @frequency_days
      @recurring_event.image = params[:event][:image]
      saved = @recurring_event.create_multiple_events
      flash[:notice] = "#{view_context.pluralize(saved, 'event')} created"
      redirect_to organization_events_path(@organization)
    elsif !@recurring && @event.save
      redirect_to organization_event_path(@event.organization, @event)
    elsif !@recurring && @event.errors
      render :action => :new
    end
  end

  def edit
    @event = resource
    authorize! :update, @event
    @organization = Organization.find params[:organization_id]
    @event.organization = @organization
    set_times
    edit!
  end

  def update
    @event = resource
    authorize! :update, @event
    @organization = Organization.find params[:organization_id]
    @event.organization = @organization
    set_times
    update!
  end

  def show
    @event = resource
    @days_left = @event.time_left[0]
    @hours_left = @event.time_left[1]
    @minutes_left = @event.time_left[2]
  end

  def volunteer
    Participation.volunteer(resource, current_user)
    redirect_to organization_event_url(@event.organization, @event)
  end

  def index
    @organization = Organization.find params[:organization_id]
    @upcoming_events = @organization.upcoming_events
    @finished_events = @organization.finished_events
  end

  private
  def set_times
    @start_time_selected = @event.start_time ? @event.start_time.strftime("%I:%M %p") : ""
    @end_time_selected = @event.end_time ? @event.end_time.strftime("%I:%M %p") : ""
    @times = [["", ""],
      ["12:00 AM", "12:00 AM"],
      ["12:30 AM", "12:30 AM"],
      ["01:00 AM", "01:00 AM"],
      ["01:30 AM", "01:30 AM"],
      ["02:00 AM", "02:00 AM"],
      ["02:30 AM", "02:30 AM"],
      ["03:00 AM", "03:00 AM"],
      ["03:30 AM", "03:30 AM"],
      ["04:00 AM", "04:00 AM"],
      ["04:30 AM", "04:30 AM"],
      ["05:00 AM", "05:00 AM"],
      ["05:30 AM", "05:30 AM"],
      ["06:00 AM", "06:00 AM"],
      ["06:30 AM", "06:30 AM"],
      ["07:00 AM", "07:00 AM"],
      ["07:30 AM", "07:30 AM"],
      ["08:00 AM", "08:00 AM"],
      ["08:30 AM", "08:30 AM"],
      ["09:00 AM", "09:00 AM"],
      ["09:30 AM", "09:30 AM"],
      ["10:00 AM", "10:00 AM"],
      ["10:30 AM", "10:30 AM"],
      ["11:00 AM", "11:00 AM"],
      ["11:30 AM", "11:30 AM"],
      ["12:00 PM", "12:00 PM"],
      ["12:30 PM", "12:30 PM"],
      ["01:00 PM", "01:00 PM"],
      ["01:30 PM", "01:30 PM"],
      ["02:00 PM", "02:00 PM"],
      ["02:30 PM", "02:30 PM"],
      ["03:00 PM", "03:00 PM"],
      ["03:30 PM", "03:30 PM"],
      ["04:00 PM", "04:00 PM"],
      ["04:30 PM", "04:30 PM"],
      ["05:00 PM", "05:00 PM"],
      ["05:30 PM", "05:30 PM"],
      ["06:00 PM", "06:00 PM"],
      ["06:30 PM", "06:30 PM"],
      ["07:00 PM", "07:00 PM"],
      ["07:30 PM", "07:30 PM"],
      ["08:00 PM", "08:00 PM"],
      ["08:30 PM", "08:30 PM"],
      ["09:00 PM", "09:00 PM"],
      ["09:30 PM", "09:30 PM"],
      ["10:00 PM", "10:00 PM"],
      ["10:30 PM", "10:30 PM"],
      ["11:00 PM", "11:00 PM"],
      ["11:30 PM", "11:30 PM"]
      ]
  end
end
