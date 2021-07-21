class RepoAssociationSerializer < ActiveModel::Serializer
  attributes :name

  has_many :events, serializer: EventSerializer
end