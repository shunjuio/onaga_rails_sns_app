module Resolvers
  class ProfileResolver < BaseResolver
    type Types::ProfileType, null: false
    argument :id, ID

    def resolve(id:)
      ::User.find(id)
    end
  end
end
