class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_type, :public, :repo_id, :repo_name, :actor_id, :actor_name

  def repo_name
  	object.repo.name
  end
  
  def actor_name
  	object.actor.name
  end
end