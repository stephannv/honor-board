class BaseSerializer < Surrealist::Serializer
  def self.represent(object, _options = {})
    serializer = new(object)
    serializer.build_schema
  end
end
