class ParticipantSerializer < BaseSerializer
  json_schema do
    {
      id: String,
      username: String
    }
  end
end
