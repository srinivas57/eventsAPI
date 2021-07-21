class EventsController < ApplicationController
  def index
    events = Event.all
    render json: events, each_serializer: EventSerializer, status: :ok
  end
  
  def create
    event = Event.create!(create_params)
    render json: event, serializer: EventSerializer, status: :created
  end

  def update
    event.update!(update_params)
    render json: event, serializer: EventSerializer, status: :ok
  end

  def show
    render json: event, serializer: EventSerializer, status: :ok
  end

  private
  
  def create_params
    params.require(:event).permit(:event_type, :public, :repo_id, :actor_id).tap do |param|
      param.require(%i[event_type repo_id actor_id])
    end
  end

  def update_params
    params.require(:event).permit(:event_type, :public, :repo_id, :actor_id).tap do |param|
      param.require(%i[event_type])
    end
  end

  def event
    @_event ||= Event.find(params.require(:id))
  end
end
