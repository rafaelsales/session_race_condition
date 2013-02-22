class SessionRaceConditionController < ApplicationController

  def index
    now = Time.now.strftime("%T")
    session[:creation] = now unless session[:creation]
    render :json => session
  end

  def change_session_lazy
    sleep 10
    session[:one] = 'Hello'
    render :json => session
  end

  def change_session_fast
    sleep 2
    session[:two] = 'World!'
    render :json => session
  end
end
