class Event < ApplicationRecord
  belongs_to :repo
  belongs_to :actor, :class_name => "User", :foreign_key => "actor_id"
  validates :event_type, inclusion: { in: ["PushEvent", "ReleaseEvent", "WatchEvent"] }, presence: true
end
