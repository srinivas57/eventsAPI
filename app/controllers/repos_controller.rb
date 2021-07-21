class ReposController < ApplicationController
  def show
    render json: event, serializer: EventAssociationSerializer, status: :ok
  end

  private

  def event
    @_event ||= Repo.find(id: params.require(:id))
  end
end
