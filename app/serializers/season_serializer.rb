class SeasonSerializer < BaseSerializer
  json_schema do
    {
      id: String,
      title: String,
      started_at: Date
    }
  end
end
