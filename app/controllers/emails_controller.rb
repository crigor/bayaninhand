class EmailsController < ActionController::Base
  def create
    if EventEmailReceiver.receive(request)
      render :json => { :status => "ok" }
    else
      render :json => { :status => "rejected" }, :status => 403
    end
  end
end
