class Stylist
  attr_reader(:id, :name, :contact, :client_id)

  define_method (:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @contact = attributes.fetch(:contact)
    @client_id = attributes.fetch(:client_id)
  end
end
