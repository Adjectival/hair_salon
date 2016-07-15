class Client
  attr_reader(:id, :name, :contact)

  define_method (:initialize) do |attributes|
    @id = attributes(:id)
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
  end
end
